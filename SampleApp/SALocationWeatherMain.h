//
//  SALocationWeatherMain.h
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SALocationWeatherMain : NSObject
@property (assign, nonatomic) double humidity, pressure;
@property (strong, nonatomic) NSString *temp;
- (id)initWithJSON:(id)JSON;
@end
