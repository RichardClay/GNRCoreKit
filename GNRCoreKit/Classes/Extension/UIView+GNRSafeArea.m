//
//  UIView+GNRSafeArea.m
//  GNRPanScrollViewController
//
//  Created by LvYuan on 2017/10/30.
//  Copyright © 2017年 UUPT. All rights reserved.
//

#import "UIView+GNRSafeArea.h"
#import "Masonry.h"

@implementation UIView (GNRSafeArea)

+ (BOOL)G_Is_IPhoneX{
    if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        return CGSizeEqualToSize(CGSizeMake(1125.f, 2436.f), [UIScreen mainScreen].currentMode.size);
    } else {
        return NO;
    }
}

- (UIEdgeInsets)g_safeAreaInsets{
    if (@available(iOS 11.0, *)) {
        return self.safeAreaInsets;
    }
    return UIEdgeInsetsZero;
}

- (MASViewAttribute *)g_masSafeAreaInsets{
    if (@available(iOS 11.0, *)) {
        return self.mas_safeAreaLayoutGuide;
    }
    return nil;
}

- (id)g_masSafeAreaTop{
    if (@available(iOS 11.0, *)) {
        return self.mas_safeAreaLayoutGuideTop;
    }
    return nil;
}

- (MASViewAttribute *)g_masSafeAreaBottom{
    if (@available(iOS 11.0, *)) {
        return self.mas_safeAreaLayoutGuideBottom;
    }
    return nil;
}

- (CGFloat)g_safeAreaBottomConstant{
    if ([UIView G_Is_IPhoneX]) {
        return 34.f;
    }
    return 0;
}

- (CGFloat)g_navigationBarHeight{
    return 44.f;
}

- (CGFloat)g_statusBarHeight{
    if ([UIView G_Is_IPhoneX]) {
        return 44.f;
    }
    return 20.f;
}

//statusBar + navigationBar
- (CGFloat)g_safeAreaTopConstant{
    return self.g_statusBarHeight + self.g_navigationBarHeight;
}

@end
