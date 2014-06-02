//
//  SALocationWeatherWeather.h
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SALocationWeatherWeather : NSObject

@property (assign, nonatomic) NSInteger id;
//NOTE - cannot use description, reserved
@property (strong,nonatomic) NSString *main, *weatherDescription, *icon;

- (id)initWithJSON:(id)JSON;
@end
