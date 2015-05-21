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
    
    
    NSLog(@"the object value is:%lu",(unsigned long)[(NSString*)[UIDevice currentDevice].model rangeOfString:@"iPhone" options:NSCaseInsensitiveSearch].location);
    NSLog(@"the object value is:%@",[UIDevice currentDevice].model);
    
    if([(NSString*)[UIDevice currentDevice].model rangeOfString:@"iPhone" options:NSCaseInsensitiveSearch].location != NSNotFound ) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"true"];
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"false"];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void) isTablet:(CDVInvokedUrlCommand *)command{
    
    // Cordova Result object and string to send to JS
    CDVPluginResult* pluginResult = nil;
    
    if([(NSString*)[UIDevice currentDevice].model rangeOfString:@"iPad" options:NSCaseInsensitiveSearch].location != NSNotFound ) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"true"];
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"false"];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void) getPhoneNumber:(CDVInvokedUrlCommand *)command{
    
    // Cordova Result object and string to send to JS
    CDVPluginResult* pluginResult = nil;
    
    NSLog(@"in the getPhoneNumber method");
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

-(void) fixPortrait:(CDVInvokedUrlCommand *)command{
    
    // Cordova Result object and string to send to JS
    CDVPluginResult* pluginResult = nil;
    
    NSLog(@"in the fixPortrait method");
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void) allowRotation:(CDVInvokedUrlCommand *)command{
    
    // Cordova Result object and string to send to JS
    CDVPluginResult* pluginResult = nil;
    
    NSLog(@"in the allowRotation method");
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

@end