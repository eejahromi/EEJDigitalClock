//
//  EEJClockView.h
//  ClockExample
//
//  Created by Ehsan on 5/19/16.
//  Copyright © 2016 Ehsan Jahromi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EEJDigitalClock : UIView

/**
 *  Color of the time label.
 */
@property (strong, nonatomic) UIColor *textColor;

/**
 *  Hour on the clock at the moment
 */
@property (strong, nonatomic, readonly) NSString *hour;

/**
 *  Minute on the clock at the moment
 */
@property (strong, nonatomic, readonly) NSString *minute;

/**
 *  Second on the clock at the moment
 */
@property (strong, nonatomic, readonly) NSString *second;

@end
