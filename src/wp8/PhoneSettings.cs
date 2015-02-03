using WPCordovaClassLib.Cordova;
using WPCordovaClassLib.Cordova.Commands;
using WPCordovaClassLib.Cordova.JSON;

namespace Cordova.Extension.Commands {
    public class PhoneSettings : BaseCommand {
        public void isPhone(string options) {
            try {
                DispatchCommandResult(new PluginResult(PluginResult.Status.OK, !calculateIsTablet()));
            } catch (System.Exception) {
                // TVB - Return error
                DispatchCommandResult(new PluginResult(PluginResult.Status.ERROR, "PhoneSettings.isPhone error"));
            }
        }
		
		public void isTablet(string options) {
            try {
                DispatchCommandResult(new PluginResult(PluginResult.Status.OK, calculateIsTablet()));
            } catch (System.Exception) {
                // TVB - Return error
                DispatchCommandResult(new PluginResult(PluginResult.Status.ERROR, "PhoneSettings.isTablet error"));
            }
        }
		
		public void getPhoneNumber(string options) {
            try {
				//TVB - Retrieving the phone number is not allowed in windows, therefore we're returning an empty string.
                DispatchCommandResult(new PluginResult(PluginResult.Status.OK, ""));
            } catch (System.Exception) {
                // TVB - Return error
                DispatchCommandResult(new PluginResult(PluginResult.Status.ERROR, "PhoneSettings.getPhoneNumber error"));
            }
        }
		
		public void fixPortrait(string options) {
            try {
                DispatchCommandResult();
            } catch (System.Exception) {
                // TVB - Return error
                DispatchCommandResult(new PluginResult(PluginResult.Status.ERROR, "PhoneSettings.fixPortrait error"));
            }
        }
		
		public void allowRotation(string options) {
            try {
                DispatchCommandResult();
            } catch (System.Exception) {
                // TVB - Return error
                DispatchCommandResult(new PluginResult(PluginResult.Status.ERROR, "PhoneSettings.allowRotation error"));
            }
        }

        private bool calculateIsTablet() {
			//TVB - Currently no tablets are supported so no need to do calculations
            return false;
        }
    }
}