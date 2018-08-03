//
//  UIViewController+NonBase.h
//  SLAOPDemo
//
//  Created by RY on 2018/5/23.
//  Copyright © 2018年 KK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NonBase)

@property (nonatomic, strong) NSDictionary *params;

@property (nonatomic, strong) id <SLControllerProtocol> viewModel;

@end
