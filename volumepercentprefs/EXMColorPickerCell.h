#import <Preferences/Preferences.h>
#import <rootless.h>

#define YOUR_PREFS ROOT_PATH_NS(@"/var/mobile/Library/Preferences/com.gilshahar7.volumepercentprefs.plist")

@interface PSTableCell (PrivateColourPicker)
- (UIViewController *)_viewControllerForAncestor;
@end

@interface EXMColorPickerCell : PSTableCell <UIColorPickerViewControllerDelegate>
@property (nonatomic, retain) UILabel *headerLabel;
@property (nonatomic, retain) UIView *colorPreview;
@property (nonatomic, retain) UIColor *tintColour;
@end