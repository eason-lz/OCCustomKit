//
//  NSString+Regular.m
//  OC_FM
//
//  Created by eason on 2018/11/28.
//  Copyright © 2018 eason. All rights reserved.
//

#import "NSString+Regular.h"

@implementation NSString (Regular)

/**
 *  身份证
 */
- (BOOL)isIdentityCard {
    if (self.length <= 0) {
        return NO;
    }
    
    static NSPredicate *pred = nil;
    if (!pred) {
        NSString *regex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
        pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    }
    return [pred evaluateWithObject:self];
}

/**
 *  邮箱
 */
- (BOOL)isEmailAdress {
    if (self.length <= 0) {
        return NO;
    }
    
    static NSPredicate *pred = nil;
    if (!pred) {
        NSString *emailCheck = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        pred = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", emailCheck];
    }
    return [pred evaluateWithObject:self];
}

/**
 *  银行卡
 */
- (BOOL)isBankCard {
    if(self.length == 0) {
        return NO;
    }
    
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < self.length; i++) {
        c = [self characterAtIndex:i];
        if (isdigit(c)) {
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--) {
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo) {
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        } else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}

/**
 *  数字、字母、汉字
 */
- (BOOL)isNoEnCn {
    if (self.length <= 0) {
        return NO;
    }
    
    static NSPredicate *pred = nil;
    if (!pred) {
        NSString *regex = @"[0-9a-zA-Z\u4e00-\u9fa5]+";
        pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    }
    return [pred evaluateWithObject:self];
}

/**
 是不是纯数字
 */
- (BOOL)deptNumInputShouldNumber
{
    if (self.length == 0) {
        return NO;
    }
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

/**
 数字、字母（10位到12位）
 */
- (BOOL)isNoAndEn {
    if (self.length <= 0) {
        return NO;
    }
    
    static NSPredicate *pred = nil;
    if (!pred) {
        NSString *regex = @"[0-9a-zA-Z]{10,12}";
        pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    }
    return [pred evaluateWithObject:self];
}

@end
