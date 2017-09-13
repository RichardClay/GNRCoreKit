//
//  UIColor+GNRExtension.h
//  Pods
//
//  Created by LvYuan on 2017/9/12.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (GNRExtension)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;

@end
