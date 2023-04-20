#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PrivateImageView : UIView

@property (nonatomic, strong) UIImage* image;
@property (nonatomic, assign) AVLayerVideoGravity contentMode;
@property (nonatomic, assign) BOOL preventCapture;

- (instancetype)initWithImage:(UIImage*)image contentMode:(AVLayerVideoGravity)contentMode preventCapture:(BOOL)preventCapture;

@end