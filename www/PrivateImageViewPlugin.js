var exec = require('cordova/exec');

exports.show = function(imageData, success, error) {
    exec(success, error, 'PrivateImageView', 'show', [imageData]);
};
