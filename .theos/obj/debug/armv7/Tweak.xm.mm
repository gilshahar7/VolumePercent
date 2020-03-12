#line 1 "Tweak.xm"
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



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBElasticVolumeViewController; 
static void (*_logos_orig$_ungrouped$SBElasticVolumeViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBElasticVolumeViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBElasticVolumeViewController$updateVolumeLevel$)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, float); static void _logos_method$_ungrouped$SBElasticVolumeViewController$updateVolumeLevel$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, float); static void (*_logos_orig$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, long long, BOOL, id); static void _logos_method$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, long long, BOOL, id); static void (*_logos_orig$_ungrouped$SBElasticVolumeViewController$_updateForAxisChange$)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, int); static void _logos_method$_ungrouped$SBElasticVolumeViewController$_updateForAxisChange$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, int); static void _logos_method$_ungrouped$SBElasticVolumeViewController$layoutVolumePercent(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); 

#line 43 "Tweak.xm"

__attribute__((used)) static BOOL _logos_method$_ungrouped$SBElasticVolumeViewController$enlarged(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { NSValue * value = objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$enlarged); BOOL rawValue; [value getValue:&rawValue]; return rawValue; }; __attribute__((used)) static void _logos_method$_ungrouped$SBElasticVolumeViewController$setEnlarged(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, BOOL rawValue) { NSValue * value = [NSValue valueWithBytes:&rawValue objCType:@encode(BOOL)]; objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$enlarged, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static BOOL _logos_method$_ungrouped$SBElasticVolumeViewController$orientationFlippedToLandscape(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { NSValue * value = objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$orientationFlippedToLandscape); BOOL rawValue; [value getValue:&rawValue]; return rawValue; }; __attribute__((used)) static void _logos_method$_ungrouped$SBElasticVolumeViewController$setOrientationFlippedToLandscape(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, BOOL rawValue) { NSValue * value = [NSValue valueWithBytes:&rawValue objCType:@encode(BOOL)]; objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$orientationFlippedToLandscape, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UILabel * _logos_method$_ungrouped$SBElasticVolumeViewController$percentLabel(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$percentLabel); }; __attribute__((used)) static void _logos_method$_ungrouped$SBElasticVolumeViewController$setPercentLabel(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$percentLabel, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSLayoutConstraint * _logos_method$_ungrouped$SBElasticVolumeViewController$centerConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (NSLayoutConstraint *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$centerConstraint); }; __attribute__((used)) static void _logos_method$_ungrouped$SBElasticVolumeViewController$setCenterConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, NSLayoutConstraint * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$centerConstraint, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSArray * _logos_method$_ungrouped$SBElasticVolumeViewController$outsideConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (NSArray *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$outsideConstraint); }; __attribute__((used)) static void _logos_method$_ungrouped$SBElasticVolumeViewController$setOutsideConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, NSArray * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$outsideConstraint, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSArray * _logos_method$_ungrouped$SBElasticVolumeViewController$topConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (NSArray *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$topConstraint); }; __attribute__((used)) static void _logos_method$_ungrouped$SBElasticVolumeViewController$setTopConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, NSArray * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$topConstraint, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
static void _logos_method$_ungrouped$SBElasticVolumeViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  _logos_orig$_ungrouped$SBElasticVolumeViewController$viewDidLoad(self, _cmd);
  self.enlarged = true;
  self.orientationFlippedToLandscape = false;
  if(!self.percentLabel){
    UILabel *percentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 47, 20)];
    float currentVolume = [self currentVolume];
    currentVolume = currentVolume*100;
    NSString *percentstr = [NSString stringWithFormat:@"%.0f%%", currentVolume];
    [percentLabel setText:percentstr];
    [percentLabel setFont:[UIFont systemFontOfSize:fontSizeEnlarged]];
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    [percentLabel setTextColor:LCPParseColorString([prefs objectForKey:@"enlargedColor"], @"#d3d3d3")];
    [percentLabel setTextAlignment:NSTextAlignmentCenter];
    [percentLabel setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];
    percentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.sliderView addSubview:percentLabel];



    
    self.centerConstraint = [NSLayoutConstraint constraintWithItem:percentLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.sliderView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    [self.sliderView addConstraint:self.centerConstraint];

    
    NSNumber *verticalPaddingEnlarged2 = [NSNumber numberWithFloat:verticalPaddingEnlarged];
    NSDictionary *metricsVPE = [NSDictionary dictionaryWithObjectsAndKeys:verticalPaddingEnlarged2, @"verticalPaddingEnlarged", nil];
    self.topConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-verticalPaddingEnlarged-[percentLabel]" options:0 metrics:metricsVPE views:NSDictionaryOfVariableBindings(percentLabel)];
    [self.sliderView addConstraints:self.topConstraint];


    
    NSArray *heightConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[percentLabel(==20)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(percentLabel)];
    [self.sliderView addConstraints:heightConstraint];

    self.percentLabel = percentLabel;
  }

}

static void _logos_method$_ungrouped$SBElasticVolumeViewController$updateVolumeLevel$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, float arg1){
  _logos_orig$_ungrouped$SBElasticVolumeViewController$updateVolumeLevel$(self, _cmd, arg1);
  if(self.percentLabel){
    arg1 = arg1*100;
    NSString *percentstr = [NSString stringWithFormat:@"%.0f%%", arg1];
    [self.percentLabel setText:percentstr];
  }
}



static void _logos_method$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long state, BOOL arg2, id arg3){
  _logos_orig$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$(self, _cmd, state, arg2, arg3);
  [self layoutVolumePercent];
}

static void _logos_method$_ungrouped$SBElasticVolumeViewController$_updateForAxisChange$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int arg1){
  _logos_orig$_ungrouped$SBElasticVolumeViewController$_updateForAxisChange$(self, _cmd, arg1);
  [self layoutVolumePercent];
}


static void _logos_method$_ungrouped$SBElasticVolumeViewController$layoutVolumePercent(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  NSInteger state = MSHookIvar<NSInteger>(self, "_state");
  UILabel *percentLabel = self.percentLabel;
  if(percentLabel){
    if (self.axis == 1){
            

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
        [percentLabel setTextColor:LCPParseColorString([prefs objectForKey:@"minimizedColor"], @"#d3d3d3")];
        [percentLabel setFont:[UIFont systemFontOfSize:fontSizeMinimized]];
        [self.view layoutIfNeeded];
        [self.percentLabel sizeToFit];
        self.orientationFlippedToLandscape = true;
      }
    }else if(self.axis == 2){
        

      if(state == 2){ 
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
          [percentLabel setTextColor:LCPParseColorString([prefs objectForKey:@"minimizedColor"], @"#d3d3d3")];

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
          [percentLabel setTextColor:LCPParseColorString([prefs objectForKey:@"enlargedColor"], @"#d3d3d3")];

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




static __attribute__((constructor)) void _logosLocalCtor_aa7416eb(int __unused argc, char __unused **argv, char __unused **envp){
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.gilshahar7.volumepercentprefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);


}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBElasticVolumeViewController = objc_getClass("SBElasticVolumeViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$SBElasticVolumeViewController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(updateVolumeLevel:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$updateVolumeLevel$, (IMP*)&_logos_orig$_ungrouped$SBElasticVolumeViewController$updateVolumeLevel$);MSHookMessageEx(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(transitionToState:animated:completion:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$, (IMP*)&_logos_orig$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$);MSHookMessageEx(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(_updateForAxisChange:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$_updateForAxisChange$, (IMP*)&_logos_orig$_ungrouped$SBElasticVolumeViewController$_updateForAxisChange$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(layoutVolumePercent), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$layoutVolumePercent, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(BOOL)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(enlarged), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$enlarged, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(BOOL)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(setEnlarged:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$setEnlarged, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(BOOL)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(orientationFlippedToLandscape), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$orientationFlippedToLandscape, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(BOOL)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(setOrientationFlippedToLandscape:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$setOrientationFlippedToLandscape, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(percentLabel), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$percentLabel, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(setPercentLabel:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$setPercentLabel, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSLayoutConstraint *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(centerConstraint), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$centerConstraint, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSLayoutConstraint *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(setCenterConstraint:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$setCenterConstraint, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSArray *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(outsideConstraint), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$outsideConstraint, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSArray *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(setOutsideConstraint:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$setOutsideConstraint, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSArray *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(topConstraint), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$topConstraint, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSArray *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(setTopConstraint:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$setTopConstraint, _typeEncoding); } } }
#line 214 "Tweak.xm"
