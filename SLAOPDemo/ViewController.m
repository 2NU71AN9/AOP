//
//  ViewController.m
//  SLAOPDemo
//
//  Created by RY on 2018/5/23.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate>

@end

@implementation ViewController

- (void)sl_bindViewForController{
    
    self.view = [[SLFirstView alloc]initWithFrame:[UIScreen mainScreen].bounds];
}

- (void)sl_viewDidLoad {
    
}

@end
