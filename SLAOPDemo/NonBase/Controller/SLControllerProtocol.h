//
//  SLControllerProtocol.h
//  SLAOPDemo
//
//  Created by RY on 2018/5/23.
//  Copyright © 2018年 KK. All rights reserved.
//

@protocol SLControllerProtocol <NSObject>

@optional

/// 绑定View
- (void)sl_bindViewForController;

/// 绑定viewModel
- (void)sl_bindViewModelForController;

/// 配置导航栏
- (void)sl_configNavigationForController;

/// viewDidLoad
- (void)sl_viewDidLoad;

/// ...

@end
