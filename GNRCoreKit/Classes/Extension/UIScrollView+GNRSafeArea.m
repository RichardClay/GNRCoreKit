
//
//  UIScrollView+GNRSafeArea.m
//  GNRPanScrollViewController
//
//  Created by LvYuan on 2017/10/30.
//  Copyright © 2017年 UUPT. All rights reserved.
//

#import "UIScrollView+GNRSafeArea.h"

@implementation UIScrollView (GNRSafeArea)

- (UIEdgeInsets)g_contentInset{
    if (@available(iOS 11, *)) {
        return self.adjustedContentInset;
    }
    return self.contentInset;
}

@end
