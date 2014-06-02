//
//  SAHomeViewController.m
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import "SAHomeViewController.h"
#import "SAServiceCallsViewController.h"

@interface SAHomeViewController ()
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *aboutButton, *serviceCallsButton;
@property (strong, nonatomic) NSMutableDictionary *views, *metrics;
@end

@implementation SAHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (UILabel *)titleLabel {
	if (!_titleLabel) {
		_titleLabel = [[UILabel alloc]init];
		_titleLabel.text = @"My title";
		_titleLabel.numberOfLines = 0;
		_titleLabel.textColor = [UIColor blackColor];
		_titleLabel.backgroundColor = [UIColor clearColor];
		[_titleLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
		[_titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
	}
	return _titleLabel;
}

- (UIButton *)serviceCallsButton {
	if (!_serviceCallsButton) {
		_serviceCallsButton = [[UIButton alloc]init];
		_serviceCallsButton.backgroundColor = [UIColor btnBackground];
        [_serviceCallsButton setTitleColor:[UIColor btnTextColor] forState:UIControlStateNormal];
		[_serviceCallsButton setTitle:NSLocalizedString(@"Call Services", nil) forState:UIControlStateNormal];
		[_serviceCallsButton setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_serviceCallsButton addTarget:self action:@selector(serviceCallAction:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _serviceCallsButton;
}

- (void)serviceCallAction:(id)sender {
	SAServiceCallsViewController *controller = [[SAServiceCallsViewController alloc] init];
	[self.navigationController pushViewController:controller animated:YES];
}

- (UIButton *)aboutButton {
	if (!_aboutButton) {
		_aboutButton = [[UIButton alloc]init];
		_aboutButton.backgroundColor = [UIColor btnBackground];
        [_aboutButton setTitleColor:[UIColor btnTextColor] forState:UIControlStateNormal];
		[_aboutButton setTitle:NSLocalizedString(@"About", nil) forState:UIControlStateNormal];
		[_aboutButton setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_aboutButton addTarget:self action:@selector(aboutAction:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _aboutButton;
}

- (void)aboutAction:(id)sender {
	//SPObjectFormViewController *controller = [[SPObjectFormViewController alloc] init];
	//[self.navigationController pushViewController:controller animated:YES];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
		self.edgesForExtendedLayout = UIRectEdgeNone;
	}
	self.view.backgroundColor = [UIColor whiteColor];

	[self.view addSubview:self.titleLabel];
	[self.view addSubview:self.aboutButton];
	[self.view addSubview:self.serviceCallsButton];

	[self addConstraints];
}

- (NSMutableDictionary *)metrics {
	if (!_metrics) {
		_metrics = [[NSMutableDictionary alloc]init];
		[_metrics setObject:@44 forKey:@"buttonHeight"];
	}

	return _metrics;
}

- (NSMutableDictionary *)views {
	if (!_views) {
		_views = [[NSMutableDictionary alloc]init];
		[_views setObject:self.titleLabel forKey:@"titleLabel"];
		[_views setObject:self.aboutButton forKey:@"aboutButton"];
		[_views setObject:self.serviceCallsButton forKey:@"serviceCallsButton"];
	}

	return _views;
}

- (void)addConstraints {
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[titleLabel]-|" options:0 metrics:nil views:self.views]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[aboutButton]-|" options:0 metrics:nil views:self.views]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[serviceCallsButton]-|" options:0 metrics:nil views:self.views]];

	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[titleLabel]-[aboutButton(buttonHeight)]-[serviceCallsButton(buttonHeight)]" options:0 metrics:self.metrics views:self.views]];
}

@end
