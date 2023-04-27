var exec = require('cordova/exec');

var PrivateImageView = function() {};

PrivateImageView.prototype.setImage = function(image) {
    exec(null, null, "YourPluginName", "setImage", [image]);
};

PrivateImageView.prototype.setImageContentMode = function(mode) {
    exec(null, null, "YourPluginName", "setImageContentMode", [mode]);
};

PrivateImageView.prototype.setPreventCapture = function(prevent) {
    exec(null, null, "YourPluginName", "setPreventCapture", [prevent]);
};

module.exports = PrivateImageView;
