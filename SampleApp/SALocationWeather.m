//
//  SALocationWeather.m
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import "SALocationWeather.h"

@implementation SALocationWeather

- (id)initWithJSON:(id)JSON {
    self = [super init];
    NSDictionary *gps = [JSON objectForKey:@"coord"];
    CLLocation *LocationAtual = [[CLLocation alloc] initWithLatitude:[[gps valueForKey:@"lat"] doubleValue] longitude:[[gps valueForKey:@"lon"] doubleValue]];
    self.coord = LocationAtual.coordinate;

    NSDictionary *sysJSON = [JSON objectForKey:@"sys"];
    self.sys = [[SALocationWeatherSys alloc]initWithJSON:sysJSON];
    
    NSDictionary *weatherJSON = [JSON objectForKey:@"weather"];
    self.weather = [[SALocationWeatherWeather alloc]initWithJSON:weatherJSON];
    
    NSDictionary *mainJSON = [JSON objectForKey:@"main"];
    self.main = [[SALocationWeatherMain alloc]initWithJSON:mainJSON];
    
    return self;
}
@end
