//
//  NSString+GNRExtension.m
//  Pods
//
//  Created by LvYuan on 2017/9/12.
//
//

#import "NSString+GNRExtension.h"

@implementation NSString (GNRExtension)

+ (NSAttributedString *)replaceBracketsFromString:(NSString *)str textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize {
    if (str == nil) {
        return nil;
    }
    
    NSAttributedString *attStr = [NSString attStringForStr:str ranges:[NSString rangesForString:str] textColor:textColor font:[UIFont boldSystemFontOfSize:fontSize] lineSpace:4];
    
    if (attStr == nil) {
        return [[NSMutableAttributedString alloc] initWithString:[NSString getTotalString:str]];
    }
    
    return attStr;
}

+ (NSAttributedString *)replaceBracketsFromString:(NSString *)str textColor:(UIColor *)textColor font:(UIFont *)font lineSpace:(CGFloat)lineSpace {
    if (str == nil) {
        return nil;
    }
    NSAttributedString *attStr = [NSString attStringForStr:str ranges:[NSString rangesForString:str] textColor:textColor font:font lineSpace:lineSpace];
    
    return attStr;
    
}

+ (NSAttributedString *)replaceBracketsFromString:(NSString *)str textColor:(UIColor *)textColor font:(UIFont *)font bracketTextColor:(UIColor *)bracketTextColor bracketFont:(UIFont *)bracketFont {
    
    if (str == nil) {
        return nil;
    }
    
    NSAttributedString *attStr = [NSString attStringForBracketStr:str ranges:[NSString rangesForString:str] Bracketranges:[NSString rangesForBracketString:str] textColor:textColor font:font BracketextColor:bracketTextColor Brackefont:bracketFont lineSpace:0];
    
    if (attStr == nil) {
        return [[NSMutableAttributedString alloc] initWithString:[NSString getTotalString:str]];
    }
    return attStr;
    
}

+ (NSAttributedString *)attStringForBracketStr:(NSString *)string ranges:(NSArray <NSString *> *)ranges Bracketranges:(NSArray <NSString *> *)Bracketranges textColor:(UIColor *)textColor font:(UIFont *)font BracketextColor:(UIColor *)BracketextColor Brackefont:(UIFont *)Brackefont lineSpace:(CGFloat)lineSpace {
    if (string.length && ranges.count) {
        NSString *totalStr = [NSString getTotalString:string];
        totalStr = [NSString getTotalbracketString:totalStr];
        NSMutableAttributedString *attS = [[NSMutableAttributedString alloc] initWithString:totalStr];
        
        [ranges enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
            if (obj) {
                NSRange range = NSRangeFromString(obj);
                if (ranges && range.location != NSNotFound) {
                    [attS addAttribute:NSForegroundColorAttributeName value:textColor range:range];
                    [attS addAttribute:NSFontAttributeName value:font range:range];
                    
                }
            }
        }];
        
        [Bracketranges enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
            if (obj) {
                NSRange range = NSRangeFromString(obj);
                if (Bracketranges && range.location != NSNotFound) {
                    [attS addAttribute:NSForegroundColorAttributeName value:BracketextColor range:range];
                    [attS addAttribute:NSFontAttributeName value:Brackefont range:range];
                    
                }
            }
        }];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:lineSpace];
        paragraphStyle.alignment = NSTextAlignmentCenter;
        [attS addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [totalStr length])];
        
        return attS;
    }
    return nil;
}

+ (NSAttributedString *)attStringForStr:(NSString *)string ranges:(NSArray <NSString *> *)ranges textColor:(UIColor *)textColor font:(UIFont *)font lineSpace:(CGFloat)lineSpace {
    if (string.length) {
        NSString *totalStr = [NSString getTotalString:string];
        
        NSMutableAttributedString *attS = [[NSMutableAttributedString alloc] initWithString:totalStr];
        
        [ranges enumerateObjectsUsingBlock:^(NSString *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
            if (obj) {
                NSRange range = NSRangeFromString(obj);
                if (ranges && range.location != NSNotFound) {
                    [attS addAttribute:NSForegroundColorAttributeName value:textColor range:range];
                    [attS addAttribute:NSFontAttributeName value:font range:range];
                    
                }
            }
        }];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:lineSpace];
        [paragraphStyle setParagraphSpacing:lineSpace * 1.2];
        paragraphStyle.alignment = NSTextAlignmentCenter;
        [attS addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [totalStr length])];
        return attS;
    }
    return nil;
}

+ (NSArray *)rangesForString:(NSString *)string {
    NSMutableArray *ranges = [NSMutableArray array];
    NSMutableArray *locs = [NSMutableArray array];
    string = [NSString getTotalbracketString:string];
    
    if (string.length > 0) {
        //locs
        NSUInteger count = 0;
        for (int i = 0; i < string.length; i++) {
            char ch = [string characterAtIndex:i];
            if (ch == '{') {
                [locs addObject:@(i - 2 * count++).stringValue];
            }
        }
        
        NSMutableArray *values = [NSMutableArray array];
        //ranges
        NSArray *strArr = [string componentsSeparatedByString:@"{"];
        [strArr enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
            NSString *subValue = obj;
            if (idx != 0) {
                NSArray *subArr = [subValue componentsSeparatedByString:@"}"];
                if (subArr.count == 2 && subArr.firstObject) {
                    [values addObject:subArr.firstObject];
                }
            }
        }];
        
        //还原字符串
        string = [NSString getTotalString:string];
        
        [values enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
            if (obj) {
                NSString *value = obj;
                NSRange range = NSMakeRange([locs[idx] intValue], value.length);
                if (range.location != NSNotFound) {
                    [ranges addObject:NSStringFromRange(range)];
                }
            }
        }];
    }
    return ranges;
}

+ (NSArray *)rangesForBracketString:(NSString *)string {
    NSMutableArray *ranges = [NSMutableArray array];
    NSMutableArray *locs = [NSMutableArray array];
    string = [NSString getTotalString:string];
    
    if (string.length > 0) {
        //locs‘
        NSUInteger count = 0;
        for (int i = 0; i < string.length; i++) {
            char ch = [string characterAtIndex:i];
            if (ch == '<') {
                [locs addObject:@(i - 2 * count++).stringValue];
            }
        }
        
        NSMutableArray *values = [NSMutableArray array];
        //ranges
        NSArray *strArr = [string componentsSeparatedByString:@"<"];
        [strArr enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
            NSString *subValue = obj;
            if (idx != 0) {
                NSArray *subArr = [subValue componentsSeparatedByString:@">"];
                if (subArr.count == 2 && subArr.firstObject) {
                    [values addObject:subArr.firstObject];
                }
            }
        }];
        
        //还原字符串
        string = [NSString getTotalbracketString:string];
        
        [values enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
            if (obj) {
                NSString *value = obj;
                NSRange range = NSMakeRange([locs[idx] intValue], value.length);
                if (range.location != NSNotFound) {
                    [ranges addObject:NSStringFromRange(range)];
                }
            }
        }];
    }
    return ranges;
}

+ (NSString *)getTotalString:(NSString *)string {
    NSString *totalStr = [string stringByReplacingOccurrencesOfString:@"{" withString:@""];
    totalStr = [totalStr stringByReplacingOccurrencesOfString:@"}" withString:@""];
    
    
    return totalStr;
}

+ (NSString *)getTotalbracketString:(NSString *)string {
    NSString *totalStr = [string stringByReplacingOccurrencesOfString:@"<" withString:@""];
    totalStr = [totalStr stringByReplacingOccurrencesOfString:@">" withString:@""];
    return totalStr;
}

@end
