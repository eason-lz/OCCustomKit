//
//  NSString+Extension.h
//  OC_FM
//
//  Created by eason on 2018/11/28.
//  Copyright © 2018 eason. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

/**
 *  快速返回代码行ID
 */
+ (NSString *)CODE_ID;

/**
 *  中文转小写拼音(无音标)
 */
- (NSString *)pinyin;


@end

NS_ASSUME_NONNULL_END
