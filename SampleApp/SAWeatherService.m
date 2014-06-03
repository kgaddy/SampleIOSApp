//
//  SAWeatherService.m
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import "SAWeatherService.h"
#import "SALocationWeather.h"
#import "AFHTTPRequestOperationManager.h"

@implementation SAWeatherService

-(SALocationWeather *)getLocalWeather:(NSString *)locationString success:(success)success failure:(failure)failure{
    SALocationWeather *localWeather;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.openweathermap.org/data/2.5/weather?q=St.%20Louis,usa&units=imperial" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);

        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    
    return localWeather;
}

@end
