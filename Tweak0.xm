
@interface _UILegibilityLabel
@property (nonatomic, retain) NSString *string;
@end

@interface SBElasticSliderView : UIView
@end

@interface SBElasticVolumeViewController : UIViewController
@property (nonatomic, retain) UILabel *percentLabel;
@property (nonatomic,readonly) SBElasticSliderView * sliderView;
-(float)currentVolume;
@end

%hook SBElasticVolumeViewController
%property (nonatomic, retain) UILabel *percentLabel;
-(void)viewDidLoad{
  %orig;

  if(!self.percentLabel){
    self.percentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 47, 20)];
    float currentVolume = [self currentVolume];
    currentVolume = currentVolume*100;
    NSString *percentstr = [NSString stringWithFormat:@"%.0f%%", currentVolume];
    [self.percentLabel setText:percentstr];//Set text in label.
    [self.percentLabel setTextColor:[UIColor colorWithRed:0.81 green:0.81 blue:0.81 alpha:1.0]];//Set text color in label.
    [self.percentLabel setTextAlignment:NSTextAlignmentCenter];//Set text alignment in label.
    [self.percentLabel setBaselineAdjustment:UIBaselineAdjustmentAlignBaselines];//Set line adjustment.
    [self.sliderView addSubview:self.percentLabel];

  }

}

-(void)updateVolumeLevel:(float)arg1{
  %orig;
  if(self.percentLabel){
    // if(self.sliderView.frame.size.width < 15){
    //   self.percentLabel.frame = CGRectMake(0, 0, 58, 20);
    // }else if(15 < self.sliderView.frame.size.width){
    //   self.percentLabel.frame = CGRectMake(0, 0, self.sliderView.frame.size.width, 20);
    //   [self.percentLabel setTextAlignment:NSTextAlignmentCenter];
    // }
    arg1 = arg1*100;
    NSString *percentstr = [NSString stringWithFormat:@"%.0f%%", arg1];
    [self.percentLabel setText:percentstr];

  }
}


-(void)_updateTouchTrackingView{
  %orig;
  if(self.sliderView.frame.size.width < 15){
   [UIView animateWithDuration:0.4
        animations:^{
          self.percentLabel.frame = CGRectMake(0, 0, 58, 20);
          //[self.sliderView layoutIfNeeded];
        }
        completion:^ (BOOL completed){
        }];
  }else if(15 < self.sliderView.frame.size.width){
    CGRect targetFrame = CGRectMake(0, 0, self.sliderView.frame.size.width, 20);
    [UIView animateWithDuration:0.4
         animations:^{
           self.percentLabel.frame = targetFrame;
           //[self.sliderView layoutIfNeeded];
       }
             completion:^ (BOOL completed){
             }];
  }
}

%end
