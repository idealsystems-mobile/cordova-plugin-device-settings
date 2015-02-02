# Phone Settings Plugin


This is a **Cordova** plugin to access phone settings information.
This plugin is **Android** only as of now.

## Install

Assuming the Cordova CLI is installed (version 3.0 >), from the command line run:

*cordova plugin add /path/to/the/plugin/PhoneSettingAndroidPlugin/*

## Methods

* __phoneSettings.getPhysicalSize__

	Return an approximated (calculated) size of the phone or tablet (expressed in inches)

* __phoneSettings.getPhoneNumber__

	Return the phone number of the phone if applicable

* __phoneSettings.isPhone__

	Return true if the physical size is smaller than 6.5 inches, return false otherwise 

* __phoneSettings.isTablet__

  Return true if the physical size is greater than 6.5 inches, return false otherwise 

* __phoneSettings.fixPortrait__
  Android specific
  Fixes the orientation to portrait for the devices considered phones (phoneSettings.isPhone)


Permissions
-----------
> uses-permission android:name="android.permission.**`READ__PHONE_STATE`**"