#import <Cordova/CDVPlugin.h>
#import "PrivateImageView.h"

@interface PrivateImageViewPlugin : CDVPlugin

- (void)showPrivateImage:(CDVInvokedUrlCommand*)command;

@end