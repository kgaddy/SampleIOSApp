//
//  SAServiceCallsViewController.m
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import "SAServiceCallsViewController.h"
#import "SAInfoCard.h"
#import "SAWeatherService.h"
#import "SAWeatherView.h"

@interface SAServiceCallsViewController ()
@property (strong, nonatomic) SAInfoCard *infoCard;
@property (strong, nonatomic) NSMutableDictionary *views, *metrics;
@property (strong, nonatomic) UIButton *getWeatherButton;
@property (strong, nonatomic) SALocationWeather *weather;
@property (strong, nonatomic) SAWeatherView *weatherView;
@end

@implementation SAServiceCallsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}
	self.view.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:self.infoCard];
	[self.view addSubview:self.getWeatherButton];
	[self addConstraints];
    
    [self currentLocationInitializing];
}

- (void)currentLocationInitializing {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    self.location = locations[0];
    [self.locationManager stopUpdatingLocation];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder reverseGeocodeLocation:self.location completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (!(error))
         {
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             NSString *city = [[NSString alloc]initWithString:placemark.locality];
             NSLog(@"\n\nCurrent City:\n %@\n\n", city);
         }
         else
         {
             NSLog(@"There was an error : %@", error);
             NSLog(@"\nCurrent Location Not Detected\n");
         }
     }];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Sorry, I was unable to identify your location." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (UIButton *)getWeatherButton {
	if (!_getWeatherButton) {
		_getWeatherButton = [[UIButton alloc]init];
		_getWeatherButton.backgroundColor = [UIColor btnBackground];
		[_getWeatherButton setTitleColor:[UIColor btnTextColor] forState:UIControlStateNormal];
		[_getWeatherButton setTitle:NSLocalizedString(@"Get Weather", nil) forState:UIControlStateNormal];
		[_getWeatherButton setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_getWeatherButton addTarget:self action:@selector(weatherCallAction:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _getWeatherButton;
}

- (void)weatherCallAction:(id)sender {
	SAWeatherService *svc = [[SAWeatherService alloc]init];

	void (^success)(NSDictionary *) = ^void (NSDictionary *result) {
		self.weather = [[SALocationWeather alloc]initWithJSON:result];
        self.weatherView = [[SAWeatherView alloc]initWithWeather:self.weather];
        //self.weatherView.backgroundColor = [UIColor orangeColor];
        
        [self.weatherView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_views setObject:self.weatherView forKey:@"weatherView"];
        [self.view addSubview:self.weatherView];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[weatherView]-|" options:0 metrics:nil views:self.views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[getWeatherButton]-[weatherView]" options:0 metrics:nil views:self.views]];
	};

	void (^failure)(NSError *) = ^void (NSError *error) {
	};

	[svc getLocalWeather:@"St. Louis" success:success failure:failure];
}

- (SAInfoCard *)infoCard {
	if (!_infoCard) {
		_infoCard = [[SAInfoCard alloc]initWithTitleAndDescription:@"AFNetworking Demo" description:@"iOS and OS X networking framework"];
		[_infoCard setTranslatesAutoresizingMaskIntoConstraints:NO];
	}
	return _infoCard;
}

- (NSMutableDictionary *)metrics {
	if (!_metrics) {
		_metrics = [[NSMutableDictionary alloc]init];
	}

	return _metrics;
}

- (NSMutableDictionary *)views {
	if (!_views) {
		_views = [[NSMutableDictionary alloc]init];
		[_views setObject:self.infoCard forKey:@"infoCard"];
		[_views setObject:self.getWeatherButton forKey:@"getWeatherButton"];
        
	}
	return _views;
}

- (void)addConstraints {
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[infoCard]|" options:0 metrics:nil views:self.views]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[getWeatherButton]-|" options:0 metrics:nil views:self.views]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[infoCard]-[getWeatherButton(44)]" options:0 metrics:nil views:self.views]];
}

@end
