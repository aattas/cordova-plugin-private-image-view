import UIKit
import AVFoundation

@objc(PrivateImageView) class PrivateImageView: CDVPlugin {
    var imageView: UIPrivateImageView?
    
    @objc(create:)
    func create(command: CDVInvokedUrlCommand) {
        imageView = UIPrivateImageView()
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }
    
    @objc(updateImage:)
    func updateImage(command: CDVInvokedUrlCommand) {
        guard let imageData = command.arguments[0] as? Data,
              let image = UIImage(data: imageData) else {
            let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
            commandDelegate.send(pluginResult, callbackId: command.callbackId)
            return
        }
        imageView?.updateImage(to: image)
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        commandDelegate.send(pluginResult, callbackId: command.callbackId)
    }
}
