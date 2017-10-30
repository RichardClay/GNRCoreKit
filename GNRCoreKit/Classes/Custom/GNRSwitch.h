//
//  GNRSwitch.h
//  GNRSwitch
//
//  Created by LvYuan on 2017/10/20.
//  Copyright © 2017年 UUPT. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE @interface GNRSwitch : UIControl

@property (nonatomic, assign, getter=isOn)IBInspectable BOOL on;
@property (nonatomic, strong)IBInspectable UIColor *onTintColor;
@property (nonatomic, strong)IBInspectable UIColor *offTintColor;

- (void)setOn:(BOOL)on animated:(BOOL)animated;

@end

