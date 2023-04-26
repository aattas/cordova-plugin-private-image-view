import UIKit
import AVFoundation

@objc(PrivateImageView) class PrivateImageView: CDVPlugin {
    var imageView: UIPrivateImageView?

    @objc(create:)
    func create(command: CDVInvokedUrlCommand) {
        let imageView = UIPrivateImageView()
        self.webView.superview?.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.contentMode = .scaleAspectFit
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
