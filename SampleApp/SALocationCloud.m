//
//  SALocationCloud.m
//  SampleApp
//
//  Created by Chris Hustedt on 6/12/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import "SALocationCloud.h"

@implementation SALocationCloud
- (id)initWithJson:(id)JSON {
    self = [super init];
    
    [self setCloudPercentage:[JSON valueForKey:@"all"]];
    [self setCloud:@"Cloud Coverage"];
    [self setCloudImage:@""];
    return self;
}
- (void)initCloudImage{
    if(_cloudPercentage.integerValue <=25){
        _cloudImage = @"☀️";
    }
    else if(_cloudPercentage.integerValue > 25 && _cloudPercentage.integerValue <=75){
        _cloudImage = @"⛅️";
    }
    else{
        _cloudImage = @"☁️";
    }
}
@end
