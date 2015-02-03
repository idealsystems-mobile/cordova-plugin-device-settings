using WPCordovaClassLib.Cordova;
using WPCordovaClassLib.Cordova.Commands;
using WPCordovaClassLib.Cordova.JSON;

using Microsoft.Phone.Controls;
using System.Windows;

namespace Cordova.Extension.Commands {
    public class PhoneSettings : BaseCommand {
        private const string UNLOCKED = "unlocked";
        private const string PORTRAIT = "portrait";
        private const string LANDSCAPE = "landscape";

        public void isPhone(string options) {
            try {
                DispatchCommandResult(new PluginResult(PluginResult.Status.OK, (!calculateIsTablet()).ToString().ToLower()));
            } catch (System.Exception) {
                // TVB - Return error
                DispatchCommandResult(new PluginResult(PluginResult.Status.ERROR, "PhoneSettings.isPhone error"));
            }
        }
		
		public void isTablet(string options) {
            try {
                DispatchCommandResult(new PluginResult(PluginResult.Status.OK, (calculateIsTablet()).ToString().ToLower()));
            } catch (System.Exception) {
                // TVB - Return error
                DispatchCommandResult(new PluginResult(PluginResult.Status.ERROR, "PhoneSettings.isTablet error"));
            }
        }
		
		public void getPhoneNumber(string options) {
            try {
                
                DispatchCommandResult(new PluginResult(PluginResult.Status.OK, ""));
            } catch (System.Exception) {
                // TVB - Return error
                DispatchCommandResult(new PluginResult(PluginResult.Status.ERROR, "PhoneSettings.getPhoneNumber error"));
            }
        }
		
		public void fixPortrait(string options) {
            try {
				//System.Console.Write("Plugin PhoneSettings.fixPortrait");
                DispatchCommandResult(new PluginResult(PluginResult.Status.OK, true));
            } catch (System.Exception) {
                // TVB - Return error
                DispatchCommandResult(new PluginResult(PluginResult.Status.ERROR, "PhoneSettings.fixPortrait error"));
            }
        }
		
		public void allowRotation(string options) {
            try {
                Deployment.Current.Dispatcher.BeginInvoke(() =>
                {
                    PhoneApplicationFrame frame;
                    PhoneApplicationPage page;

                    if (TryCast(Application.Current.RootVisual, out frame) &&
                      TryCast(frame.Content, out page))
                    {
                        page.SupportedOrientations = SupportedPageOrientation.PortraitOrLandscape;
                        
                    }
                });
                DispatchCommandResult(new PluginResult(PluginResult.Status.OK, true));
            } catch (System.Exception) {
                // TVB - Return error
                DispatchCommandResult(new PluginResult(PluginResult.Status.ERROR, "PhoneSettings.allowRotation error"));
            }
        }

        static bool TryCast<T>(object obj, out T result) where T : class
        {
            result = obj as T;
            return result != null;
        }

        private bool calculateIsTablet()
        {
            return false;
        }

    }
}