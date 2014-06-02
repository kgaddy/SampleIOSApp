//
//  SALocationWeatherSys.m
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import "SALocationWeatherSys.h"

@implementation SALocationWeatherSys


- (id)initWithJSON:(id)JSON {
    self = [super init];

    
    [self setCountry:[JSON valueForKey:@"country"]];
    [self setSunrise:[[JSON valueForKey:@"sunrise"] doubleValue]];
    [self setSunset:[[JSON valueForKey:@"sunset"] doubleValue]];


    
    
    return self;
}

@end
