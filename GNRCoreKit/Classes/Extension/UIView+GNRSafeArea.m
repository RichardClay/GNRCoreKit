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
    return [UIView g_safeAreaBottomConstant];
}

- (CGFloat)g_navigationBarHeight{
    return [UIView g_navigationBarHeight];
}

- (CGFloat)g_statusBarHeight{
    return [UIView g_statusBarHeight];
}

//statusBar + navigationBar
- (CGFloat)g_safeAreaTopConstant{
    return [UIView g_safeAreaTopConstant];
}

+ (BOOL)G_Is_IPhoneX{
    
    /**iPhone X 、iPhone XS、iPhone XS Max、iPhone XR 适配*/
    BOOL iPhoneXSeries = NO;
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneXSeries;
    }
    
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneXSeries = YES;
        }
    }
    
    return iPhoneXSeries;
}

+ (CGFloat)g_safeAreaBottomConstant{
    if ([UIView G_Is_IPhoneX]) {
        return 34.f;
    }
    return 0;
}

+ (CGFloat)g_navigationBarHeight{
    return 44.f;
}

+ (CGFloat)g_statusBarHeight{
    if ([UIView G_Is_IPhoneX]) {
        return 44.f;
    }
    return 20.f;
}

//statusBar + navigationBar
+ (CGFloat)g_safeAreaTopConstant{
    return self.g_statusBarHeight + self.g_navigationBarHeight;
}

@end

