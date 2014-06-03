//
//  SALocationWeatherWeather.m
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import "SALocationWeatherWeather.h"

@implementation SALocationWeatherWeather
- (id)initWithJSON:(id)JSON {
	self = [super init];
	[self setWeatherDescription:[JSON valueForKey:@"description"]];
	[self setMain:[JSON valueForKey:@"main"]];
	return self;
}

@end
