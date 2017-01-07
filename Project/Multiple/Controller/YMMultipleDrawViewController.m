//
//  YMMultipleDrawViewController.m
//  TouchTracker
//
//  Created by Lym on 2017/1/7.
//  Copyright © 2017年 Lym. All rights reserved.
//

#import "YMMultipleDrawViewController.h"
#import "YMMultipleView.h"

@interface YMMultipleDrawViewController ()

@end

@implementation YMMultipleDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadView {
    self.view = [[YMMultipleView alloc] initWithFrame:CGRectZero];
}

@end
