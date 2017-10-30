//
//  GNRSwitch.h
//  GNRSwitch
//
//  Created by LvYuan on 2017/10/20.
//  Copyright © 2017年 UUPT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GNRSwitch : UIControl

@property (nonatomic, assign, getter=isOn)BOOL on;
@property (nonatomic, strong)UIColor *onTintColor;
@property (nonatomic, strong)UIColor *offTintColor;

- (void)setOn:(BOOL)on animated:(BOOL)animated;

@end
