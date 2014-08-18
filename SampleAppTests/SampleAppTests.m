//
//  SampleAppTests.m
//  SampleAppTests
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SALocationWeatherMain.h"
#import "SAJSONObjectUtil.h"


@interface SampleAppTests : XCTestCase

@end

@implementation SampleAppTests

- (void)setUp {
	[super setUp];
	// Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
	// Put teardown code here. This method is called after the invocation of each test method in the class.
	[super tearDown];
}

- (void)testMainInitWithJSON{

    SAJSONObjectUtil *jsonUtil = [SAJSONObjectUtil sharedInstance];
    NSMutableDictionary *JSON = [jsonUtil generateWeatherMain:@"50" humidity:@"300" pressure:@"200"];
    SALocationWeatherMain *weatherMain = [[SALocationWeatherMain alloc]initWithJSON:JSON];
    XCTAssertTrue([weatherMain.temp isEqualToString:@"50"]);
    XCTAssertTrue(weatherMain.humidity == 300);
    XCTAssertTrue(weatherMain.pressure == 200);
}
- (void)testTempCovert {
	float celsius = 1;
	SALocationWeatherMain *weatherMain = [[SALocationWeatherMain alloc]init];
	XCTAssertTrue([[weatherMain convertToFahrenheit:celsius] isEqualToString:@"33"]);
}

@end
