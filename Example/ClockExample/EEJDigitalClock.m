//
//  EEJClockView.m
//  ClockExample
//
//  Created by Ehsan on 5/19/16.
//  Copyright © 2016 Ehsan Jahromi. All rights reserved.
//

#import "EEJDigitalClock.h"
@import CoreText;

@interface EEJDigitalClock()
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UIView *point;
@property (strong, nonatomic) UIView *point2;
@end
@implementation EEJDigitalClock {
    CGRect viewFrame;
    BOOL even;
}
// TODO: Custom font
// TODO: AM/PM
// TODO: Label movement
// TODO: Orientation
// TODO: Read-only time read

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        
        viewFrame = frame;
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, frame.size.width/2.0, frame.size.width, 200.0)];
        _label.textColor = [UIColor blackColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:32.0];
        
        _point = [[UIView alloc]initWithFrame:CGRectMake(0.0, _label.frame.origin.y + _label.frame.size.height, 20.0, 1.0)];
        _point.backgroundColor = [UIColor redColor];
        _point2 = [[UIView alloc]initWithFrame:CGRectMake(_label.frame.size.width - 20.0, _label.frame.origin.y, 20.0, 1.0)];
        _point2.backgroundColor = [UIColor redColor];
      
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
        
        [self addSubview:_label];
        [self addSubview:_point];
        [self addSubview:_point2];
    }
    
    return self;
}

- (void)updateTime {
    
    if(even) {
        [UIView animateWithDuration:0.95 animations:^{
            _point.frame = CGRectMake(viewFrame.size.width - 20.0, _label.frame.origin.y + _label.frame.size.height, 20.0, 1.0);
            _point2.frame = CGRectMake(0.0, _label.frame.origin.y, 20.0, 1.0);
        }];
    } else {
        [UIView animateWithDuration:0.95 animations:^{
            _point.frame = CGRectMake(0.0, _label.frame.origin.y + _label.frame.size.height, 20.0, 1.0);
            _point2.frame = CGRectMake(viewFrame.size.width - 20.0, _label.frame.origin.y, 20.0, 1.0);
        }];
    }
    
    even = !even;
    
    NSString *hour, *minute, *second;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar componentsInTimeZone:[NSTimeZone localTimeZone] fromDate:[NSDate date]];
    
    if(dateComponents.second < 10) {
        second = [NSString stringWithFormat:@"0%ld",(long)dateComponents.second];
    } else {
        second = [NSString stringWithFormat:@"%ld",(long)dateComponents.second];
    }
    
    if(dateComponents.minute < 10) {
        minute = [NSString stringWithFormat:@"0%ld",(long)dateComponents.minute];
    } else {
        minute = [NSString stringWithFormat:@"%ld",(long)dateComponents.minute];
    }
    
    if(dateComponents.hour < 10) {
        hour = [NSString stringWithFormat:@"0%ld",(long)dateComponents.hour];
    } else {
        hour = [NSString stringWithFormat:@"%ld",(long)dateComponents.hour];
    }
    
    _label.text = [NSString stringWithFormat:@"%@ : %@ : %@", hour, minute, second];
}

#pragma mark - Configurations

- (void)setTextColor:(UIColor *)textColor {
    _label.textColor = textColor;
}

@end
