//
//  UIView+NonBase.m
//  SLAOPDemo
//
//  Created by RY on 2018/5/23.
//  Copyright © 2018年 KK. All rights reserved.
//

#import "UIView+NonBase.h"

@implementation UIView (NonBase)

- (void)setVisitorView{
    for (UIView * subView in self.subviews) {
        [subView removeFromSuperview];
    }
    self.backgroundColor = [UIColor grayColor];
}

@end
