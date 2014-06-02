//
//  SAWeatherView.h
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SALocationWeather.h"

@interface SAWeatherView : UIView
- (id)initWithWeather:(SALocationWeather *)weather;
@end
