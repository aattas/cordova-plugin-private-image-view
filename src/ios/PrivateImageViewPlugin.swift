import Foundation
import AVFoundation

@objc(PrivateImageViewPlugin) class PrivateImageViewPlugin : CDVPlugin {
    var privateImageView: PrivateImageView?

    @objc(setImage:)
    func setImage(command: CDVInvokedUrlCommand) {
        guard let imageData = command.arguments[0] as? String else { return }
        guard let data = Data(base64Encoded: imageData) else { return }
        let image = UIImage(data: data)
        privateImageView?.image(image)
    }

    @objc(setImageContentMode:)
    func setImageContentMode(command: CDVInvokedUrlCommand) {
        let mode = command.arguments[0] as? AVLayerVideoGravity
        privateImageView?.imageContentMode(mode)
    }

    @objc(setPreventCapture:)
    func setPreventCapture(command: CDVInvokedUrlCommand) {
        let prevent = command.arguments[0] as? Bool
        privateImageView?.preventCapture(prevent)
    }
}
