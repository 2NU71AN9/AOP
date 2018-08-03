//
//  UIViewController+NonBase.m
//  SLAOPDemo
//
//  Created by RY on 2018/5/23.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "UIViewController+NonBase.h"
#import <objc/runtime.h>

static const void * ParamsKey = &ParamsKey;
static const void * viewModelKey = &viewModelKey;

@implementation UIViewController (NonBase)

- (void)setParams:(NSDictionary *)params{
    objc_setAssociatedObject(self, ParamsKey, params, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(NSDictionary *)params{
    return objc_getAssociatedObject(self, ParamsKey);
}

- (void)setViewModel:(id<SLControllerProtocol>)viewModel{
    objc_setAssociatedObject(self, viewModelKey, viewModel, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(id<SLControllerProtocol>)viewModel{
    return objc_getAssociatedObject(self, viewModelKey);
}

@end
