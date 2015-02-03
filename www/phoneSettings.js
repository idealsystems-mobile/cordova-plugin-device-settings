var phoneSettings = {
     getPhoneNumber: function(successCallback, errorCallback) {
        cordova.exec(
        	successCallback, // returns the CLI (phone number) when possible (android) or an empty string (ios)
            errorCallback, // error callback function
            'PhoneSettings', // mapped to our native Java class called "PhoneSettings"
            'getPhoneNumber',
            []
        ); 
     },
     isPhone: function(successCallback, errorCallback) {
        cordova.exec(
        	successCallback, // returns true/false
            errorCallback, // error callback function
            'PhoneSettings', // mapped to our native Java class called "PhoneSettings"
            'isPhone',
            []
        ); 
     },
     isTablet: function(successCallback, errorCallback) {
        cordova.exec(
        	successCallback, // returns true/false
            errorCallback, // error callback function
            'PhoneSettings', // mapped to our native Java class called "PhoneSettings"
            'isTablet',
            []
        ); 
     },
     fixPortrait: function(successCallback, errorCallback) {
		console.log("plugin js fixPortrait");
         cordova.exec(
            successCallback, // returns true/false
            errorCallback, // error callback function
            'PhoneSettings', // mapped to our native Java class called "PhoneSettings"
            'fixPortrait',
            []
         ); 
     },
     allowRotation: function(successCallback, errorCallback) {
         cordova.exec(
             successCallback, // returns true/false
             errorCallback, // error callback function
             'PhoneSettings', // mapped to our native Java class called "PhoneSettings"
             'allowRotation',
             []
          ); 
     }
}
module.exports = phoneSettings;