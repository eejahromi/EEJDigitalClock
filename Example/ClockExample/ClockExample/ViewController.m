//
//  ViewController.m
//  ClockExample
//
//  Created by Ehsan on 5/19/16.
//  Copyright © 2016 Ehsan Jahromi. All rights reserved.
//

#import "ViewController.h"
#import "EEJClockView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EEJClockView *clock = [[EEJClockView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:clock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
