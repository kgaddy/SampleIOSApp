//
//  SAInfoCard.m
//  SampleApp
//
//  Created by kgaddy on 6/2/14.
//  Copyright (c) 2014 com.yourCompany. All rights reserved.
//

#import "SAInfoCard.h"
@interface SAInfoCard()
@property (strong,nonatomic) UILabel *titleLabel, *infoDescriptionLabel;
@property (strong,nonatomic) NSString *titleString, *descriptionString;
@property (strong, nonatomic) NSMutableDictionary *views, *metrics;
@end

@implementation SAInfoCard

- (id)initWithTitleAndDescription:(NSString *)title description:(NSString *)description
{
    self = [super init];
    if (self) {
        self.titleString = title;
        self.descriptionString = description;
        [self addSubview:self.titleLabel];
        [self addSubview:self.infoDescriptionLabel];
        [self addConstraints];
    }
    return self;
}

-(UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = self.titleString;
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = [UIColor titleTextColor];
        _titleLabel.backgroundColor = [UIColor clearColor];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:18.0]];
        [_titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _titleLabel;
}

-(UILabel *)infoDescriptionLabel{
    if(!_infoDescriptionLabel){
        _infoDescriptionLabel = [[UILabel alloc]init];
        _infoDescriptionLabel.text = self.descriptionString;
        _infoDescriptionLabel.numberOfLines = 0;
        _infoDescriptionLabel.textColor = [UIColor titleTextColor];
        _infoDescriptionLabel.backgroundColor = [UIColor clearColor];
        [_infoDescriptionLabel setFont:[UIFont systemFontOfSize:12.0]];
        [_infoDescriptionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return _infoDescriptionLabel;
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
        [_views setObject:self.titleLabel forKey:@"titleLabel"];
        [_views setObject:self.infoDescriptionLabel forKey:@"infoDescriptionLabel"];
    }
    
    return _views;
}

- (void)addConstraints {
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[titleLabel]-|" options:0 metrics:self.metrics views:self.views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[infoDescriptionLabel]-|" options:0 metrics:self.metrics views:self.views]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[titleLabel]-[infoDescriptionLabel]|" options:0 metrics:self.metrics views:self.views]];
}


@end
