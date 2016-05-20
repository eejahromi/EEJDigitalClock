//
//  EEJClockView.m
//  ClockExample
//
//  Created by Ehsan on 5/19/16.
//  Copyright © 2016 Ehsan Jahromi. All rights reserved.
//

#import "EEJClockView.h"
@interface EEJClockView()
@property (strong, nonatomic) UILabel *label;
@end
@implementation EEJClockView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, frame.size.width/2.0, frame.size.width, 200.0)];
        _label.textColor = [UIColor blackColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont fontWithName:@"Noteworthy" size:32.0];
        _label.text = @"20 : 23 : 37";
        
        [self addSubview:_label];
    }
    
    return self;
}

@end
