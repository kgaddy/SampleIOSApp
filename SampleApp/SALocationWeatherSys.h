//
//  SALocationWeatherSys.h
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SALocationWeatherSys : NSObject
@property (strong,nonatomic)NSString *message;
@property (strong,nonatomic)NSString *country;
@property (assign, nonatomic)double sunrise, sunset;


- (id)initWithJSON:(id)JSON;
@end
