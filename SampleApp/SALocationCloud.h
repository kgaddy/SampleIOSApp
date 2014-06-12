//
//  SALocationCloud.h
//  SampleApp
//
//  Created by Chris Hustedt on 6/12/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SALocationCloud : NSObject
@property (strong,nonatomic)NSString *cloudPercentage;
@property (strong,nonatomic)NSString *cloud;
@property (strong,nonatomic)NSString *cloudImage;

- (id)initWithJson:(id)JSON;
- (void)initCloudImage;
@end
