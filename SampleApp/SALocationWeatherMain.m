//
//  SALocationWeatherMain.m
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import "SALocationWeatherMain.h"

@implementation SALocationWeatherMain

- (id)initWithJSON:(id)JSON {
    self = [super init];
    
    

    [self setTemp:[JSON valueForKey:@"temp"]];
    [self setHumidity:[[JSON valueForKey:@"humidity"] doubleValue]];
    [self setPressure:[[JSON valueForKey:@"pressure"] doubleValue]];
    
    
    
    return self;
}
@end
