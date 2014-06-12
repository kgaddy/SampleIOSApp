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
@property (strong,nonatomic) UILabel *tempLabel, *descriptionLabel, *locationLabel, *cloudPercentLabel, *cloudLabel, *cloudImage;
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
        [self addSubview:self.cloudPercentLabel];
        [self addSubview:self.cloudImage];
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

-(UILabel *)cloudPercentLabel{
    if(!_cloudPercentLabel){
        _cloudPercentLabel = [[UILabel alloc]init];
        _cloudPercentLabel.text = [NSString stringWithFormat:@"%@%@%@%@", self.weatherModel.clouds.cloud, @" ", self.weatherModel.clouds.cloudPercentage, @"%"];
        _cloudPercentLabel.numberOfLines = 0;
        _cloudPercentLabel.textColor = [UIColor titleTextColor];
        _cloudPercentLabel.backgroundColor = [UIColor clearColor];
        [_cloudPercentLabel setFont:[UIFont systemFontOfSize:14.0]];
        [_cloudPercentLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _cloudPercentLabel;
}

-(UILabel *)cloudImage{
    if(!_cloudImage){
        _cloudImage = [[UILabel alloc]init];
        _cloudImage.text = [NSString stringWithFormat:@"%@", self.weatherModel.clouds.cloudImage];
        _cloudImage.numberOfLines = 0;
        _cloudImage.textColor = [UIColor titleTextColor];
        _cloudImage.backgroundColor = [UIColor clearColor];
        [_cloudImage setFont:[UIFont systemFontOfSize:35.0]];
        [_cloudImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _cloudImage;
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
        [_views setObject:self.cloudPercentLabel forKey:@"cloudPercentLabel"];
        [_views setObject:self.cloudImage forKey:@"cloudImage"];
    }
    
    return _views;
}

- (void)addConstraints {

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[locationLabel]-[tempLabel]-[descriptionLabel]-[cloudPercentLabel]-[cloudImage]|" options:0 metrics:self.metrics views:self.views]];
    
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
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.cloudPercentLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual                                                        toItem:self.descriptionLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.cloudImage
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual                                                        toItem:self.cloudPercentLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
}

@end
