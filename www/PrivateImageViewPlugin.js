var exec = require('cordova/exec');

var PrivateImageView = {
    create: function (successCallback, errorCallback) {
        exec(successCallback, errorCallback, 'PrivateImageView', 'create', []);
    },
    updateImage: function (imageData, successCallback, errorCallback) {
        exec(successCallback, errorCallback, 'PrivateImageView', 'updateImage', [imageData]);
    }
};

module.exports = PrivateImageView;