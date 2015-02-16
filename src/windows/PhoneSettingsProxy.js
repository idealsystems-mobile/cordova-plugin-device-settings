var cordova = require('cordova'),
    channel = require('cordova/channel');

var isThisAPhone = (cordova.platformId == "windows") && WinJS.Utilities.isPhone;

module.exports = {
     getPhoneNumber: function(success, fail, args) {
         success("");
     },
     isPhone: function(success, fail, args) {
        success(isThisAPhone);
     },
     isTablet: function(success, fail, args) {
        success(!isThisAPhone);
     },
     fixPortrait: function(success, fail, args) {
         success(isThisAPhone);
     },
     allowRotation: function(success, fail, args) {
         success(!isThisAPhone);
     }
}

require("cordova/exec/proxy").add("PhoneSettings", module.exports);