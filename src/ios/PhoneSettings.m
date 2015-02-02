//
//  PhoneSettings.m
//  HelloWorld
//
//  Created by Geoffroy Gomet on 11/10/13.
//
//

#import "PhoneSettings.h"

@implementation PhoneSettings

-(void) isPhone:(CDVInvokedUrlCommand *)command{
    
    // Cordova Result object and string to send to JS
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    
    NSLog(@"the object value is:%u",[(NSString*)[UIDevice currentDevice].model rangeOfString:@"iPhone" options:NSCaseInsensitiveSearch].location);
    NSLog(@"the object value is:%@",[UIDevice currentDevice].model);
    
    if([(NSString*)[UIDevice currentDevice].model rangeOfString:@"iPhone" options:NSCaseInsensitiveSearch].location != NSNotFound ) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"true"];
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"false"];
    }
    
    javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    [self writeJavascript:javaScript];
}

-(void) isTablet:(CDVInvokedUrlCommand *)command{
    
    // Cordova Result object and string to send to JS
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    if([(NSString*)[UIDevice currentDevice].model rangeOfString:@"iPad" options:NSCaseInsensitiveSearch].location != NSNotFound ) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"true"];
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"false"];
    }
    
    javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    [self writeJavascript:javaScript];
}

-(void) getPhoneNumber:(CDVInvokedUrlCommand *)command{
    
    // Cordova Result object and string to send to JS
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"in the getPhoneNumber method");
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    [self writeJavascript:javaScript];

}

-(void) fixPortrait:(CDVInvokedUrlCommand *)command{
    
    // Cordova Result object and string to send to JS
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"in the getPhoneNumber method");
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    [self writeJavascript:javaScript];

}

-(void) allowRotation:(CDVInvokedUrlCommand *)command{
    
    // Cordova Result object and string to send to JS
    CDVPluginResult* pluginResult = nil;
    NSString* javaScript = nil;
    
    NSLog(@"in the getPhoneNumber method");
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    javaScript = [pluginResult toSuccessCallbackString:command.callbackId];
    [self writeJavascript:javaScript];

}

@end