//
//  YMDrawViewController.m
//  TouchTracker
//
//  Created by Lym on 2017/1/7.
//  Copyright © 2017年 Lym. All rights reserved.
//

#import "YMDrawViewController.h"
#import "YMDrawView.h"

@interface YMDrawViewController ()

@end

@implementation YMDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadView {
    self.view = [[YMDrawView alloc] initWithFrame:CGRectZero];
}

@end
