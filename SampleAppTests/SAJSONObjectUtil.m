//
//  SAJSONObjectUtil.m
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import "SAJSONObjectUtil.h"

@implementation SAJSONObjectUtil

+ (SAJSONObjectUtil *)sharedInstance {
    static SAJSONObjectUtil *sharedInstance = nil;
    static dispatch_once_t onceToken = 0;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SAJSONObjectUtil alloc] init];
    });
    return sharedInstance;
}

- (NSMutableDictionary *)generateWeatherMain:(NSString *)temp humidity:(NSString *)humidity pressure:(NSString *)pressure {
    NSMutableDictionary *json = [[NSMutableDictionary alloc] init];
    
    [json setObject:temp forKey:@"temp"];
    [json setObject:humidity forKey:@"humidity"];
    [json setObject:pressure forKey:@"pressure"];
    return json;
}


@end
