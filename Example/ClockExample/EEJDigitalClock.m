//
//  EEJClockView.m
//  ClockExample
//
//  Created by Ehsan on 5/19/16.
//  Copyright © 2016 Ehsan Jahromi. All rights reserved.
//

#import "EEJDigitalClock.h"

@interface EEJDigitalClock()
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UIView *point;
@property (strong, nonatomic) UIView *point2;
@end
@implementation EEJDigitalClock {
    CGRect viewFrame;
    NSString *hour, *minute, *second;
    NSString *mode;
    BOOL even;
}

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

#pragma mark - Time Update

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
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar componentsInTimeZone:[NSTimeZone localTimeZone] fromDate:[NSDate date]];
    
    switch (self.clockMode) {
        case EEJDigitalClockTwentyFourHourMode:
            hour = [NSString stringWithFormat:@"%ld",dateComponents.hour];
            [self formatCurrentTimeWithHour:hour minute:dateComponents.minute second:dateComponents.second];
            
            break;
        
        case EEJDigitalClockTwelveHourMode:
            if(dateComponents.hour > 12) {
                hour = [NSString stringWithFormat:@"%ld",(dateComponents.hour - 12)];
                mode = @"PM";
            } else {
                hour = [NSString stringWithFormat:@"%ld",dateComponents.hour];
                mode = @"AM";
            }
            
            [self formatCurrentTimeWithHour:hour minute:dateComponents.minute second:dateComponents.second];
            
            break;
        
        default:
            break;
    }
    
}

#pragma mark - Time Format

- (void)formatCurrentTimeWithHour:(NSString *)formatHour minute:(NSInteger)formatMinute second:(NSInteger)formatSecond {
    if(formatSecond < 10) {
        second = [NSString stringWithFormat:@"0%ld",(long)formatSecond];
    } else {
        second = [NSString stringWithFormat:@"%ld",(long)formatSecond];
    }
    
    if(formatMinute < 10) {
        minute = [NSString stringWithFormat:@"0%ld",(long)formatMinute];
    } else {
        minute = [NSString stringWithFormat:@"%ld",(long)formatMinute];
    }
    
    if([formatHour intValue] < 10) {
        hour = [NSString stringWithFormat:@"0%@",hour];
    } else {
        hour = [NSString stringWithFormat:@"%@",hour];
    }
    
    if(self.clockMode == EEJDigitalClockTwelveHourMode) {
        _label.text = [NSString stringWithFormat:@"%@ : %@ : %@ %@", hour, minute, second,mode];
    } else {
        _label.text = [NSString stringWithFormat:@"%@ : %@ : %@", hour, minute, second];
    }
}

#pragma mark - Orientation

- (void)layoutSubviews {
    [super layoutSubviews];
    self.frame = CGRectMake(self.window.bounds.origin.x,self.window.bounds.origin.y,
                            self.window.bounds.size.width, self.window.bounds.size.height);
    _label.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
}

#pragma mark - Configurations

- (void)setTextColor:(UIColor *)textColor {
    _label.textColor = textColor;
}

- (void)setCustomFont:(NSString *)customFont {
    _label.font = [UIFont fontWithName:customFont size:32.0];
}

- (void)fontWithName:(NSString *)fontName andSize:(CGFloat)size {
    _label.font = [UIFont fontWithName:fontName size:size];
}

- (NSString *)hour {
    return hour;
}

- (NSString *)minute {
    return minute;
}

- (NSString *)second {
    return second;
}

@end
