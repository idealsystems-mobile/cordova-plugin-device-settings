//
//  PhoneSettings.h
//  HelloWorld
//
//  Created by Geoffroy Gomet on 11/10/13.
//
//

#import <Cordova/CDV.h>

@interface PhoneSettings : CDVPlugin

-(void) isPhone:(CDVInvokedUrlCommand *)command;

-(void) isTablet:(CDVInvokedUrlCommand *)command;

-(void) getPhoneNumber:(CDVInvokedUrlCommand *)command;

-(void) fixPortrait:(CDVInvokedUrlCommand *)command;

-(void) allowRotation:(CDVInvokedUrlCommand *)command;

@end