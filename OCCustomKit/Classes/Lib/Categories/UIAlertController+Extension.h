//
//  UIAlertController+Extension.h
//  bestbuy
//
//  Created by eason on 2017/5/18.
//  Copyright © 2017年 eason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Extension)

+ (void)alertIn:(nonnull UIViewController *)vc
        message:(nullable NSString *)msg
        titleOK:(nonnull NSString *)okStr
      okHandler:(nullable void (^)(UIAlertAction * _Nonnull action))okHandler;

+ (void)alertIn:(nonnull UIViewController *)vc
          title:(nullable NSString *)title
        message:(nullable NSString *)msg
        titleOK:(nonnull NSString *)okStr
      okHandler:(nullable void (^)(UIAlertAction * _Nonnull action))okHandler;

+ (void)alertIn:(nonnull UIViewController *)vc
          title:(nullable NSString *)title
        message:(nullable NSString *)msg
        titleOK:(nonnull NSString *)okStr
      okHandler:(nullable void (^)(UIAlertAction * _Nonnull action))okHandler
    titleCancel:(nullable NSString *)cancelStr
  cancelHandler:(nullable void (^)(UIAlertAction * _Nonnull action))cancelHandler;

+ (void)alertIn:(nonnull UIViewController *)vc
          title:(nullable NSString *)title
        message:(nullable NSString *)msg
      selection:(nonnull NSArray<NSString *> *)selection
selectionHandler:(nullable void (^)(UIAlertAction * _Nonnull action))selectionHandler;

+ (void)actionSheetIn:(nonnull UIViewController *)vc
                title:(nullable NSString *)title
              message:(nullable NSString *)msg
            selection:(nonnull NSArray<NSString *> *)selection
     selectionHandler:(nullable void (^)(UIAlertAction * _Nonnull action))selectionHandler;

@end
