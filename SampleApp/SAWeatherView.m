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
        [self addSubview:self.tempLabel];
    }
    return self;
}

-(UILabel *)tempLabel{
    if(!_tempLabel){
        _tempLabel = [[UILabel alloc]init];
        _tempLabel.text = [NSString stringWithFormat:@"%@", self.weatherModel.main.temp];
        _tempLabel.numberOfLines = 0;
        _tempLabel.textColor = [UIColor titleTextColor];
        _tempLabel.backgroundColor = [UIColor clearColor];
        [_tempLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
        [_tempLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _tempLabel;
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
        //[_views setObject:self.descriptionLabel forKey:@"descriptionLabel"];
    }
    
    return _views;
}

- (void)addConstraints {
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[tempLabel]-|" options:0 metrics:self.metrics views:self.views]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[tempLabel]" options:0 metrics:self.metrics views:self.views]];
}




@end
