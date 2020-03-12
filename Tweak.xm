#import "libcolorpicker.h"
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.gilshahar7.volumepercentprefs.plist"

@interface _UILegibilityLabel
@property (nonatomic, retain) NSString *string;
@end

@interface SBElasticSliderView : UIView
@end

@interface SBElasticVolumeViewController : UIViewController
@property (nonatomic, retain) UILabel *percentLabel;
@property (nonatomic, retain) NSLayoutConstraint *centerConstraint;
@property (nonatomic, retain) NSArray<NSLayoutConstraint *> *outsideConstraint;
@property (nonatomic, retain) NSArray<NSLayoutConstraint *> *topConstraint;
@property (nonatomic,readonly) SBElasticSliderView * sliderView;
@property BOOL enlarged;
@property BOOL orientationFlippedToLandscape;
@property int axis;
-(float)currentVolume;
-(void)layoutVolumePercent;
@end


int fontSizeMinimized = 10;
int fontSizeEnlarged = 15;
float horizontalPaddingMinimized = 0.0;
float verticalPaddingMinimized = -20.0;
float verticalPaddingEnlarged = 10.0;

static void loadPrefs() {
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    fontSizeMinimized = (int)[[prefs objectForKey:@"fontSizeMinimized"]?:@(10) intValue];
    fontSizeEnlarged = (int)[[prefs objectForKey:@"fontSizeEnlarged"]?:@(15) intValue];
    horizontalPaddingMinimized = (int)[[prefs objectForKey:@"horizontalPaddingMinimized"]?:@(0) intValue];
    verticalPaddingMinimized = (int)[[prefs objectForKey:@"verticalPaddingMinimized"]?:@(-20) intValue];
    verticalPaddingEnlarged = (int)[[prefs objectForKey:@"verticalPaddingEnlarged"]?:@(10) intValue];


}


%hook SBElasticVolumeViewController
%property (assign) BOOL enlarged;
%property (assign) BOOL orientationFlippedToLandscape;
%property (nonatomic, retain) UILabel *percentLabel;
%property (nonatomic, retain) NSLayoutConstraint *centerConstraint;
%property (nonatomic, retain) NSArray *outsideConstraint;
%property (nonatomic, retain) NSArray *topConstraint;
-(void)viewDidLoad{
  %orig;
  self.enlarged = true;
  self.orientationFlippedToLandscape = false;
  if(!self.percentLabel){
    UILabel *percentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 47, 20)];
    float currentVolume = [self currentVolume];
    currentVolume = currentVolume*100;
    NSString *percentstr = [NSString stringWithFormat:@"%.0f%%", currentVolume];
    [percentLabel setText:percentstr];//Set text in label.
    [percentLabel setFont:[UIFont systemFontOfSize:fontSizeEnlarged]];
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    [percentLabel setTextColor:LCPParseColorString([prefs objectForKey:@"enlargedColor"], @"#d3d3d3")];//Set text color in label.
    [percentLabel setTextAlignment:NSTextAlignmentCenter];//Set text alignment in label.
    [percentLabel setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];//Set line adjustment.
    percentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.sliderView addSubview:percentLabel];



    // center percentLabel horizontally in self.sliderView
    self.centerConstraint = [NSLayoutConstraint constraintWithItem:percentLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.sliderView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    [self.sliderView addConstraint:self.centerConstraint];

    // align percentLabel from the top
    NSNumber *verticalPaddingEnlarged2 = [NSNumber numberWithFloat:verticalPaddingEnlarged];
    NSDictionary *metricsVPE = [NSDictionary dictionaryWithObjectsAndKeys:verticalPaddingEnlarged2, @"verticalPaddingEnlarged", nil];
    self.topConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-verticalPaddingEnlarged-[percentLabel]" options:0 metrics:metricsVPE views:NSDictionaryOfVariableBindings(percentLabel)];
    [self.sliderView addConstraints:self.topConstraint];


    // height constraint
    NSArray *heightConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[percentLabel(==20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(percentLabel)];
    [self.sliderView addConstraints:heightConstraint];

    self.percentLabel = percentLabel;
  }

}

-(void)updateVolumeLevel:(float)arg1{
  %orig;
  if(self.percentLabel){
    arg1 = arg1*100;
    NSString *percentstr = [NSString stringWithFormat:@"%.0f%%", arg1];
    [self.percentLabel setText:percentstr];
  }
}



-(void)transitionToState:(long long)state animated:(BOOL)arg2 completion:(/*^block*/id)arg3{
  %orig;
  [self layoutVolumePercent];
}

-(void)_updateForAxisChange:(int)arg1{
  %orig;
  [self layoutVolumePercent];
}

%new
-(void)layoutVolumePercent{
  NSInteger state = MSHookIvar<NSInteger>(self, "_state");
  UILabel *percentLabel = self.percentLabel;
  if(percentLabel){
    if (self.axis == 1){
            //landscape

      if(self.orientationFlippedToLandscape == false){

        if(self.centerConstraint == nil){
          self.centerConstraint = [NSLayoutConstraint constraintWithItem:percentLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.sliderView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
          [self.sliderView addConstraint:self.centerConstraint];
        }
        [self.sliderView removeConstraints:self.outsideConstraint];
        self.outsideConstraint = nil;

        [self.sliderView removeConstraints:self.topConstraint];

        self.topConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[percentLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(percentLabel)];
        [self.sliderView addConstraints:self.topConstraint];


        NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
        [percentLabel setTextColor:LCPParseColorString([prefs objectForKey:@"minimizedColor"], @"#d3d3d3")];//Set text color in label.
        [percentLabel setFont:[UIFont systemFontOfSize:fontSizeMinimized]];
        [self.view layoutIfNeeded];
        [self.percentLabel sizeToFit];
        self.orientationFlippedToLandscape = true;
      }
    }else if(self.axis == 2){
        //portrait

      if(state == 2){ //minimized
        if(self.enlarged == true || self.orientationFlippedToLandscape == true){
          self.enlarged = false;
          if(self.outsideConstraint == nil){
            NSNumber *horizontalPaddingMinimized2 = [NSNumber numberWithFloat:horizontalPaddingMinimized];
            NSDictionary *metricsHPM = [NSDictionary dictionaryWithObjectsAndKeys:horizontalPaddingMinimized2, @"horizontalPaddingMinimized", nil];
            self.outsideConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-horizontalPaddingMinimized-[percentLabel]" options:NSLayoutFormatDirectionLeftToRight metrics:metricsHPM views:NSDictionaryOfVariableBindings(percentLabel)];
            [self.sliderView addConstraints:self.outsideConstraint];
          }
          [self.sliderView removeConstraints:self.topConstraint];

          NSNumber *verticalPaddingMinimized2 = [NSNumber numberWithFloat:verticalPaddingMinimized];
          NSDictionary *metricsVPM = [NSDictionary dictionaryWithObjectsAndKeys:verticalPaddingMinimized2, @"verticalPaddingMinimized", nil];
          self.topConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-verticalPaddingMinimized-[percentLabel]" options:0 metrics:metricsVPM views:NSDictionaryOfVariableBindings(percentLabel)];
          [self.sliderView addConstraints:self.topConstraint];
self.orientationFlippedToLandscape = false;
          [self.sliderView removeConstraint:self.centerConstraint];
          self.centerConstraint = nil;

          NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
          [percentLabel setTextColor:LCPParseColorString([prefs objectForKey:@"minimizedColor"], @"#d3d3d3")];//Set text color in label.

          [UIView animateWithDuration:0.2 animations:^{
            [percentLabel setFont:[UIFont systemFontOfSize:fontSizeMinimized]];
            [self.view layoutIfNeeded];
            [self.percentLabel sizeToFit];
          }];
        }
      }else if(state == 3 || state == 1){
        if(self.enlarged == false || self.orientationFlippedToLandscape == true){
          self.enlarged = true;
          if(self.centerConstraint == nil){
            self.centerConstraint = [NSLayoutConstraint constraintWithItem:percentLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.sliderView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
            [self.sliderView addConstraint:self.centerConstraint];
          }
          [self.sliderView removeConstraints:self.outsideConstraint];
          self.outsideConstraint = nil;

          [self.sliderView removeConstraints:self.topConstraint];

          NSNumber *verticalPaddingEnlarged2 = [NSNumber numberWithFloat:verticalPaddingEnlarged];
          NSDictionary *metricsVPE = [NSDictionary dictionaryWithObjectsAndKeys:verticalPaddingEnlarged2, @"verticalPaddingEnlarged", nil];
          self.topConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-verticalPaddingEnlarged-[percentLabel]" options:0 metrics:metricsVPE views:NSDictionaryOfVariableBindings(percentLabel)];
          [self.sliderView addConstraints:self.topConstraint];

          NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
          [percentLabel setTextColor:LCPParseColorString([prefs objectForKey:@"enlargedColor"], @"#d3d3d3")];//Set text color in label.

self.orientationFlippedToLandscape = false;
          [UIView animateWithDuration:0.2 animations:^{
            [percentLabel setFont:[UIFont systemFontOfSize:fontSizeEnlarged]];
            [self.view layoutIfNeeded];
            [self.percentLabel sizeToFit];
          }];
        }
      }

    }
  }
}

%end


%ctor{
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.gilshahar7.volumepercentprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);


}
