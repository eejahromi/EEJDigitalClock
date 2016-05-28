//
//  ViewController.m
//  ClockExample
//
//  Created by Ehsan on 5/19/16.
//  Copyright © 2016 Ehsan Jahromi. All rights reserved.
//

#import "ViewController.h"
#import "EEJDigitalClock.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong,nonatomic) EEJDigitalClock *clock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clock = [[EEJDigitalClock alloc] initWithFrame:self.view.bounds];
    self.clock.customFont = @"Noteworthy";
    self.clock.clockMode = EEJDigitalClockTwentyFourHourMode;
    [self.view addSubview:self.clock];
    [self.view addSubview:self.button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)logStats:(UIButton *)sender {
    if([self.clock.hour intValue] < 12) {
        
    }
    NSLog(@"%d",[self.clock.hour intValue] % 12);
    
    NSLog(@"%@ %@ %@",self.clock.hour,self.clock.minute,self.clock.second);
}

@end
