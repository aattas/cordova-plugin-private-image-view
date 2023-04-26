#import "PrivateImageView.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "UIPrivateImageView.h"

@implementation PrivateImageView

- (void)show:(CDVInvokedUrlCommand*)command {
    // Get the image data from the command arguments
    NSString *imageData = [command.arguments objectAtIndex:0];
    NSData *data = [[NSData alloc] initWithBase64EncodedString:imageData options:0];
    UIImage *image = [UIImage imageWithData:data];

    // Create a PrivateImageView with the provided image
    PrivateImageView *imageView = [[PrivateImageView alloc] initWithImage:image];

    // Add the PrivateImageView to the view hierarchy
    [self.viewController.view addSubview:imageView];

    // Send a success callback to JavaScript
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end