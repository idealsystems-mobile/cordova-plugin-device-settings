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
         Windows.Graphics.Display.DisplayInformation.autoRotationPreferences = Windows.Graphics.Display.DisplayOrientations.portrait;
         success(true);
     },
     allowRotation: function(success, fail, args) {
         Windows.Graphics.Display.DisplayInformation.autoRotationPreferences = Windows.Graphics.Display.DisplayOrientations.none;
         success(true);
     }
}

require("cordova/exec/proxy").add("PhoneSettings", module.exports);