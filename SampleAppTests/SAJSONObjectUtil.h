//
//  SAJSONObjectUtil.h
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAJSONObjectUtil : NSObject
+ (SAJSONObjectUtil *)sharedInstance;
- (NSMutableDictionary *)generateWeatherMain:(NSString *)temp humidity:(NSString *)humidity pressure:(NSString *)pressure;
@end
