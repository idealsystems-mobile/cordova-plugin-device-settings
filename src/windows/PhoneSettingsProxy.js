var cordova = require('cordova'),
    channel = require('cordova/channel');

var isThisAPhone = (cordova.platformId == "windows") && WinJS.Utilities.isPhone;

module.exports = {
     getPhoneNumber: function(success, fail, args) {
        
     },
     isPhone: function(success, fail, args) {
		
        succes({isThisAPhone});
     },
     isTablet: function(success, fail, args) {
        succes({!isThisAPhone});
     },
     fixPortrait: function(success, fail, args) {
         
     },
     allowRotation: function(success, fail, args) {
         
     }
}

require("cordova/exec/proxy").add("SplashScreen", module.exports);
