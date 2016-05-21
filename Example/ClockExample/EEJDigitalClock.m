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
@end
@implementation EEJDigitalClock
// TODO: Name change to digital
// TODO: Custom font
// TODO: Custom text color
// TODO: AM/PM
// TODO: Label movement
// TODO: Orientation

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, frame.size.width/2.0, frame.size.width, 200.0)];
        _label.textColor = [UIColor blackColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:32.0];
      
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
        
        [self addSubview:_label];
    }
    
    return self;
}

- (void)updateTime {
    
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

@end
