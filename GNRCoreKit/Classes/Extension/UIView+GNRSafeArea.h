//
//  UIView+GNRSafeArea.h
//  GNRPanScrollViewController
//
//  Created by LvYuan on 2017/10/30.
//  Copyright © 2017年 UUPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GNRSafeArea)

+ (BOOL)G_Is_IPhoneX;

- (UIEdgeInsets)g_safeAreaInsets;

- (id)g_masSafeAreaInsets;

- (id)g_masSafeAreaTop;

- (id)g_masSafeAreaBottom;

- (CGFloat)g_safeAreaBottomConstant;

- (CGFloat)g_statusBarHeight;

- (CGFloat)g_navigationBarHeight;

- (CGFloat)g_safeAreaTopConstant;//statusBar + navigationBar

@end
