//
//  UIColor+SampleApp.m
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import "UIColor+SampleApp.h"

@implementation UIColor (SampleApp)

+ (UIColor *)btnBackground {
    return [UIColor appMainColor];
}

+ (UIColor *)btnTextColor {
    return [self colorWithHexValue:@"ffffff"];
}

+ (UIColor *)titleTextColor {
    return [self colorWithHexValue:@"444444"];
}

+ (UIColor *)textColor {
    return [self colorWithHexValue:@"444444"];
}

+ (UIColor *)appMainColor {
    return [self colorWithHexValue:@"606839"];
}

+ (UIColor *)colorWithHexValue:(NSString *)hexValue {
	UIColor *defaultResult = [UIColor blackColor];
    
	// Strip leading # if there is one
	if ([hexValue hasPrefix:@"#"] && [hexValue length] > 1) {
		hexValue = [hexValue substringFromIndex:1];
	}
    
	NSUInteger componentLength = 0;
    
	if ([hexValue length] == 3) componentLength = 1;
	else if ([hexValue length] == 6) componentLength = 2;
	else return defaultResult;
    
	BOOL isValid = YES;
	CGFloat components[3];
    
	for (NSUInteger i = 0; i < 3; i++) {
		NSString *component = [hexValue substringWithRange:NSMakeRange(componentLength * i, componentLength)];
        
		if (componentLength == 1) {
			component = [component stringByAppendingString:component];
		}
        
		NSScanner *scanner = [NSScanner scannerWithString:component];
		unsigned int value;
		isValid &= [scanner scanHexInt:&value];
		components[i] = (CGFloat)value / 256.0;
	}
    
	if (!isValid) {
		return defaultResult;
	}
    
	return [UIColor colorWithRed:components[0]
	                       green:components[1]
	                        blue:components[2]
	                       alpha:1.0];
}
@end
