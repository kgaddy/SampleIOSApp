//
//  SAWeatherView.m
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import "SAWeatherView.h"
#import "SALocationWeather.h"

@interface SAWeatherView()
@property (strong,nonatomic)SALocationWeather *weatherModel;
@property (strong,nonatomic) UILabel *tempLabel, *descriptionLabel, *locationLabel;
@property (strong, nonatomic) NSMutableDictionary *views, *metrics;
@end

@implementation SAWeatherView

- (id)initWithWeather:(SALocationWeather *)weather
{
    self = [super init];
    if (self) {
        self.weatherModel = weather;
        [self addSubview:self.locationLabel];
        [self addSubview:self.tempLabel];
        [self addSubview:self.descriptionLabel];
        [self addConstraints];
    }
    return self;
}


-(UILabel *)locationLabel{
    if(!_locationLabel){
        _locationLabel = [[UILabel alloc]init];
        _locationLabel.text = [NSString stringWithFormat:@"%@", @"St. Louis"];
        _locationLabel.numberOfLines = 0;
        _locationLabel.textColor = [UIColor titleTextColor];
        _locationLabel.backgroundColor = [UIColor clearColor];
        [_locationLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
        [_locationLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _locationLabel;
}

-(UILabel *)tempLabel{
    if(!_tempLabel){
        _tempLabel = [[UILabel alloc]init];
        int tempInt = [self.weatherModel.main.temp integerValue];
        _tempLabel.text = [NSString stringWithFormat:@"%d℉", tempInt];
        _tempLabel.numberOfLines = 0;
        _tempLabel.textColor = [UIColor titleTextColor];
        _tempLabel.backgroundColor = [UIColor clearColor];
        [_tempLabel setFont:[UIFont boldSystemFontOfSize:48.0]];
        [_tempLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _tempLabel;
}

-(UILabel *)descriptionLabel{
    if(!_descriptionLabel){
        _descriptionLabel = [[UILabel alloc]init];
        _descriptionLabel.text = [NSString stringWithFormat:@"%@", self.weatherModel.weather.weatherDescription];
        _descriptionLabel.numberOfLines = 0;
        _descriptionLabel.textColor = [UIColor titleTextColor];
        _descriptionLabel.backgroundColor = [UIColor clearColor];
        [_descriptionLabel setFont:[UIFont systemFontOfSize:14.0]];
        [_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _descriptionLabel;
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
        [_views setObject:self.tempLabel forKey:@"tempLabel"];
        [_views setObject:self.descriptionLabel forKey:@"descriptionLabel"];
        [_views setObject:self.locationLabel forKey:@"locationLabel"];
    }
    
    return _views;
}

- (void)addConstraints {

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[locationLabel]-[tempLabel]-[descriptionLabel]-|" options:0 metrics:self.metrics views:self.views]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.locationLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.locationLabel.superview
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.tempLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.tempLabel.superview
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.descriptionLabel.superview
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
}




@end
