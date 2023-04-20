#import "PrivateImageViewPlugin.h"

@implementation PrivateImageViewPlugin

- (void)showPrivateImage:(CDVInvokedUrlCommand*)command
{
    NSDictionary* options = [command.arguments objectAtIndex:0];
    UIImage* image = [UIImage imageNamed:[options objectForKey:@"image"]];
    AVLayerVideoGravity contentMode = kCAGravityResizeAspect;
    if ([[options objectForKey:@"contentMode"] isEqualToString:@"resize"]) {
        contentMode = kCAGravityResize;
    } else if ([[options objectForKey:@"contentMode"] isEqualToString:@"center"]) {
        contentMode = kCAGravityCenter;
    }
    BOOL preventCapture = [[options objectForKey:@"preventCapture"] boolValue];
    
    PrivateImageView* imageView = [[PrivateImageView alloc] initWithImage:image contentMode:contentMode preventCapture:preventCapture];
    
    // Add the PrivateImageView to the current view controller's view
    [self.viewController.view addSubview:imageView];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Image added"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end