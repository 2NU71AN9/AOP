//
//  SLControllerIntercepter.m
//  SLAOPDemo
//
//  Created by RY on 2018/5/23.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "SLControllerIntercepter.h"

@implementation SLControllerIntercepter

+ (void)load{
    [super load];
    [SLControllerIntercepter sharedInstance];
}

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static SLControllerIntercepter *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SLControllerIntercepter alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [UIViewController aspect_hookSelector:@selector(loadView) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo){
            [self loadView:aspectInfo.instance];
        } error:nil];
        
        [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo){
            [self viewDidLoad:aspectInfo.instance];
        } error:nil];
        
        [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated){
            [self viewWillAppear:animated controller:aspectInfo.instance];
        } error:nil];
    }
    return self;
}

- (void)loadView:(UIViewController <SLControllerProtocol>*)controller{
    if ([controller conformsToProtocol:@protocol(SLControllerProtocol)]) {
        if ([controller respondsToSelector:@selector(sl_bindViewForController)]) {
            [controller sl_bindViewForController];
        }
    }
}

- (void)viewDidLoad:(UIViewController <SLControllerProtocol>*)controller{
    if ([controller conformsToProtocol:@protocol(SLControllerProtocol)]) {
        
        controller.view.backgroundColor = [UIColor orangeColor];
        
        if ([controller respondsToSelector:@selector(sl_bindViewModelForController)]) {
            [controller sl_bindViewModelForController];
        }
        if ([controller respondsToSelector:@selector(sl_configNavigationForController)]) {
            [controller sl_configNavigationForController];
        }
        if ([controller.view conformsToProtocol:@protocol(SLViewProtocol)]) {
            if (1) {
                // 已登录
                [controller.view performSelectorOnMainThread:@selector(sl_setupUI) withObject:nil waitUntilDone:nil];
            }else{
                // 未登录
                [controller.view setVisitorView];
            }
        }
        if ([controller respondsToSelector:@selector(sl_viewDidLoad)]) {
            [controller sl_viewDidLoad];
        }
    }
}

- (void)viewWillAppear:(BOOL)animated controller:(UIViewController <SLControllerProtocol>*)controller{
    
    if ([controller.view conformsToProtocol:@protocol(SLViewProtocol)]) {
        if (0){
            // 未登录
            [controller.view setVisitorView];
        }
    }
}

@end
