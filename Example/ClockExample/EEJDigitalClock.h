//
//  EEJClockView.h
//  ClockExample
//
//  Created by Ehsan on 5/19/16.
//  Copyright © 2016 Ehsan Jahromi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,EEJDigitalClockMode) {
    EEJDigitalClockTwentyFourHourMode = 0,
    EEJDigitalClockTwelveHourMode
};

@interface EEJDigitalClock : UIView

/**
 *  Color of the time label.
 */
@property (strong, nonatomic) UIColor *textColor;

/**
 *  Custom font for the clock
 */
@property (strong, nonatomic) NSString *customFont;

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

/**
 *  Digital Clock mode
 */
@property (assign, nonatomic) enum EEJDigitalClockMode clockMode;

/**
 *  Custom font and size for the clock
 */
- (void)fontWithName:(NSString *)fontName andSize:(CGFloat)size;

@end
