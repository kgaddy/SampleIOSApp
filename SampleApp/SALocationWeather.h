//
//  SALocationWeather.h
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "SALocationWeatherSys.h"
#import "SALocationWeatherWeather.h"
#import "SALocationWeatherMain.h"
#import "SALocationCloud.h"
@interface SALocationWeather : NSObject
@property (nonatomic, assign) CLLocationCoordinate2D coord;
@property (strong,nonatomic) SALocationWeatherSys *sys;
@property (strong,nonatomic) SALocationWeatherWeather *weather;
@property (strong,nonatomic) SALocationWeatherMain *main;
@property (strong,nonatomic) SALocationCloud *clouds;
- (id)initWithJSON:(id)JSON;
@end
