//
//  GNRSwitch.m
//  GNRSwitch
//
//  Created by LvYuan on 2017/10/20.
//  Copyright © 2017年 UUPT. All rights reserved.
//

#import "GNRSwitch.h"

@interface GNRSwitch()
{
    BOOL _animated;
    CGFloat _padding;
    UIColor *_onTintColor;
    UIColor *_offTintColor;
    CGRect _defaultSize;
}
@property (nonatomic,strong)UIView * topView;
@end

@implementation GNRSwitch

- (UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:CGRectZero];
        _topView.layer.masksToBounds = YES;
        _topView.userInteractionEnabled = NO;
        _topView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_topView];
    }
    return _topView;
}

- (instancetype)init{
    if (self = [super init]) {
        [self initData];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initData];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initData];
    }
    return self;
}

- (void)initData{
    _padding = 5.f;
    _on = YES;
    self.bounds = CGRectMake(0, 0, 45, 25);
    self.backgroundColor = self.onTintColor;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.masksToBounds = YES;
    [self performAnimation:NO];
}

- (void)setOnTintColor:(UIColor *)onTintColor{
    _onTintColor = onTintColor;
    if (self.isOn) {
        self.backgroundColor = onTintColor;
    }
}

- (UIColor *)onTintColor{
    if (_onTintColor) {
        return _onTintColor;
    }
    return [UIColor orangeColor];
}

- (void)setOffTintColor:(UIColor *)offTintColor{
    _offTintColor = offTintColor;
    if (!self.isOn) {
        self.backgroundColor = offTintColor;
    }
}

- (UIColor *)offTintColor{
    if (_offTintColor) {
        return _offTintColor;
    }
    return [UIColor colorWithRed:187.0 / 255.0 green:187.0 / 255.0 blue:187.0 / 255.0 alpha:1];
}

- (void)setOn:(BOOL)on{
    [self setOn:on animated:NO];
}

- (void)setOn:(BOOL)on animated:(BOOL)animated{
    if (_on != on) {
        _on = on;
        [self performAnimation:animated];
    }
}

- (void)performAnimation:(BOOL)animated{
    [self setNeedsLayout];
    [self updateWitnAnimated:animated];
}

- (void)updateWitnAnimated:(BOOL)animated{
    _animated = animated;
    [self setNeedsDisplay];
}

- (void)layoutSubviews{
    CGFloat duration = _animated?0.2:0;
    CGFloat sizeHeight = CGRectGetHeight(self.bounds) - 2 * _padding;
    CGFloat scale = 1.28;
    CGFloat frameY = _padding;
    
    //scale
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.topView.frame = CGRectMake((CGRectGetWidth(self.bounds)-sizeHeight)/2.0, frameY, sizeHeight * scale, sizeHeight);
    } completion:^(BOOL finished) {
        
    }];
    
    //frame
    CGFloat frameX = self.isOn?(CGRectGetWidth(self.bounds)-_padding-sizeHeight):_padding;
    [UIView animateWithDuration:duration delay:duration options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.topView.frame = CGRectMake(frameX, frameY, sizeHeight, sizeHeight);
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:duration * 2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.layer.cornerRadius = CGRectGetHeight(self.bounds)/2.0;
        self.topView.layer.cornerRadius = CGRectGetHeight(self.topView.bounds)/2.0;
        self.backgroundColor = self.isOn?self.onTintColor:self.offTintColor;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)endTrackingWithTouch:(nullable UITouch *)touch withEvent:(nullable UIEvent *)event{
    [self setOn:!self.isOn animated:YES];
    [self valueChanged];
}

- (void)valueChanged{
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

@end

