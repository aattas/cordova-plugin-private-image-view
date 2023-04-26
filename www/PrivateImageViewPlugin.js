var exec = require('cordova/exec');

exports.updateImage = function (image, success, error) {
    exec(success, error, 'UIPrivateImageView', 'updateImage', [image]);
};