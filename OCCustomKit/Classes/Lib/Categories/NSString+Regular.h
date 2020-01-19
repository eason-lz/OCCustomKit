//
//  NSString+Regular.h
//  OC_FM
//
//  Created by eason on 2018/11/28.
//  Copyright © 2018 eason. All rights reserved.
//
//  正则

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Regular)

/**
 *  身份证
 */
- (BOOL)isIdentityCard;

/**
 *  邮箱
 */
- (BOOL)isEmailAdress;

/**
 *  银行卡
 */
- (BOOL)isBankCard;

/**
 *  数字、字母、汉字
 */
- (BOOL)isNoEnCn;

/**
 是不是纯数字
 */
- (BOOL)deptNumInputShouldNumber;

/**
 数字、字母（10位到12位）
 */
- (BOOL)isNoAndEn;

@end

NS_ASSUME_NONNULL_END
