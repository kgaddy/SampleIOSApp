//
//  SAWeatherService.h
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SALocationWeather.h"

@interface SAWeatherService : NSObject
typedef void (^success)(NSDictionary *);
typedef void (^failure)(NSError *);
-(SALocationWeather *)getLocalWeather:(NSString *)locationString success:(success)success failure:(failure)failure;
@end
