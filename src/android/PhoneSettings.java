package be.idealsystems.cordova.phonesettings;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.DroidGap;
import org.json.JSONArray;
import org.json.JSONException;

import android.content.Context;
import android.content.pm.ActivityInfo;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import android.view.Display;
import android.webkit.WebView;

public class PhoneSettings extends CordovaPlugin {

	private WebView mAppView;
	private DroidGap mGap;
	private DisplayMetrics displayMetrics = new DisplayMetrics();

	public final double PHONE_TABLET_DIFFERENTIATION_SIZE = 6.5;

	public static final String ACTION_GET_PHONE_NUMBER = "getPhoneNumber";
	public static final String ACTION_IS_TABLET = "isTablet";
	public static final String ACTION_IS_PHONE = "isPhone";
	public static final String ACTION_FIX_PORTRAIT = "fixPortrait";
	public static final String ACTION_ALLOW_ROTATION = "allowRotation";

	/**
	 * Constructor.
	 */
	public PhoneSettings() {
	}

	/**
	 * Sets the context of the Command. This can then be used to do things like
	 * get file paths associated with the Activity.
	 * 
	 * @param cordova
	 *            The context of the main Activity.
	 * @param webView
	 *            The CordovaWebView Cordova is running in.
	 */
	public void initialize(CordovaInterface cordova, CordovaWebView webView) {
		super.initialize(cordova, webView);

	}

	@Override
	public boolean execute(String action, JSONArray args,
			CallbackContext callbackContext) throws JSONException {
		if (action.equals(ACTION_GET_PHONE_NUMBER)) {
			callbackContext.success(this.getPhoneNumber());
			return true;
		} else if (action.equals(ACTION_IS_TABLET)) {
			callbackContext.success(Boolean.toString(this.isTablet()));
			return true;
		} else if (action.equals(ACTION_IS_PHONE)) {
			callbackContext.success(Boolean.toString(this.isPhone()));
			return true;
		} else if (action.equals(ACTION_FIX_PORTRAIT)) {
			callbackContext.success(Boolean.toString(this.fixPortrait()));
			return true;
		} else if (action.equals(ACTION_ALLOW_ROTATION)) {
			callbackContext.success(Boolean.toString(this.allowRotation()));
			return true;
		} else {
			callbackContext.error("Action is not defined in PhoneSettings.execute");
		}
		return false;
	}

	public boolean isPhone() {
		return !isTablet();
	}

	public boolean isTablet() {
		boolean tablet = this.getPhysicalSize() - PHONE_TABLET_DIFFERENTIATION_SIZE > 0;
		return tablet;
	}

	/*
	 * This method might not always return the phone number as it seems that the
	 * SIM doesn't always carry the it!
	 */
	public String getPhoneNumber() {
		TelephonyManager tm = (TelephonyManager) cordova.getActivity()
				.getSystemService(Context.TELEPHONY_SERVICE);
		String phoneNumber = tm.getLine1Number();
		return phoneNumber;
	}

	/*
	 * This method fix the layout in portrait for Android devices considered a phone.
	 */
	public boolean fixPortrait(){
		if(this.isPhone()){
			cordova.getActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
			return true;
		}else{
			return false;
		}
	}
	
	/*
	 * This method allows android phones to be rotated again by restoring the setting to default behavior.
	 */
	public boolean allowRotation(){
		if(this.isPhone()){
				cordova.getActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED);
			return true;
		}else{
			return false;
		}
	}

	/*
	 * This doesn't return the correct size, but it gives a good approximation
	 * for example, for a Samsung Galaxy S3, supposed to be 4.8in, the method
	 * returns 4.589in. It should be good enough to make the distinction between
	 * a phone and a tablet
	 */
	private double getPhysicalSize(){
		displayMetrics = initDisplayMetrics();
	    double physicalSize = Math.sqrt((displayMetrics.widthPixels * displayMetrics.widthPixels) + (displayMetrics.heightPixels * displayMetrics.heightPixels)) / displayMetrics.densityDpi;
	    return physicalSize;
	}

	private DisplayMetrics initDisplayMetrics() {
		Display display = cordova.getActivity().getWindowManager()
				.getDefaultDisplay();
		display.getMetrics(displayMetrics);
		return displayMetrics;
	}
}