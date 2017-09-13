//
//  NSString+GNRExtension.h
//  Pods
//
//  Created by LvYuan on 2017/9/12.
//
//

#import <Foundation/Foundation.h>

@interface NSString (GNRExtension)
/**
 高亮显示 {} 中的文字
 */
+ (NSAttributedString *)replaceBracketsFromString:(NSString *)str textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize;

+ (NSAttributedString *)replaceBracketsFromString:(NSString *)str textColor:(UIColor *)textColor font:(UIFont *)font bracketTextColor:(UIColor *)bracketTextColor bracketFont:(UIFont *)bracketFont;

+ (NSAttributedString *)attStringForBracketStr:(NSString *)string ranges:(NSArray <NSString *> *)ranges Bracketranges:(NSArray <NSString *> *)Bracketranges textColor:(UIColor *)textColor font:(UIFont*)font BracketextColor:(UIColor *)BracketextColor Brackefont:(UIFont*)Brackefont lineSpace:(CGFloat)lineSpace;

+ (NSAttributedString *)replaceBracketsFromString:(NSString *)str textColor:(UIColor *)textColor font:(UIFont *)font lineSpace:(CGFloat)lineSpace;

@end
