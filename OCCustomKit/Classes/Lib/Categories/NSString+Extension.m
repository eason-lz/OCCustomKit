//
//  NSString+Extension.m
//  OC_FM
//
//  Created by eason on 2018/11/28.
//  Copyright © 2018 eason. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

/**
 *  快速返回代码行ID
 */
+ (NSString *)CODE_ID {
    return [NSString stringWithFormat:@"%s.%d", __PRETTY_FUNCTION__, __LINE__];
}

/**
 *  中文转小写拼音(无音标)
 */
- (NSString *)pinyin {
    NSMutableString *pinyin = self.mutableCopy;
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, false);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, false);
    NSString *str = [pinyin stringByReplacingOccurrencesOfString:@" " withString:@""];
    return str;
}


@end
