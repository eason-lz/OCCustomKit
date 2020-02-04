//
//  UIAlertController+Extension.m
//  bestbuy
//
//  Created by eason on 2017/5/18.
//  Copyright © 2017年 eason. All rights reserved.
//

#import "UIAlertController+Extension.h"

@implementation UIAlertController (Extension)

+ (void)alertIn:(nonnull UIViewController *)vc
        message:(nullable NSString *)msg
        titleOK:(nonnull NSString *)okStr
      okHandler:(nullable void (^)(UIAlertAction * _Nonnull action))okHandler {
    
    [self alertIn:vc title:nil message:msg titleOK:okStr okHandler:okHandler titleCancel:nil cancelHandler:NULL];
}

+ (void)alertIn:(nonnull UIViewController *)vc
          title:(nullable NSString *)title
        message:(nullable NSString *)msg
        titleOK:(nonnull NSString *)okStr
      okHandler:(nullable void (^)(UIAlertAction * _Nonnull action))okHandler {
    
    [self alertIn:vc title:title message:msg titleOK:okStr okHandler:okHandler titleCancel:nil cancelHandler:NULL];
}

+ (void)alertIn:(nonnull UIViewController *)vc
          title:(nullable NSString *)title
        message:(nullable NSString *)msg
        titleOK:(nonnull NSString *)okStr
      okHandler:(nullable void (^)(UIAlertAction * _Nonnull action))okHandler
    titleCancel:(nullable NSString *)cancelStr
  cancelHandler:(nullable void (^)(UIAlertAction * _Nonnull action))cancelHandler {
    
    if (!vc) return;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    if (okStr) {
        [alert addAction:[UIAlertAction actionWithTitle:okStr style:UIAlertActionStyleDefault handler:okHandler]];        
    }
    if (cancelStr) {
        [alert addAction:[UIAlertAction actionWithTitle:cancelStr style:UIAlertActionStyleCancel handler:cancelHandler]];
    }
    [vc presentViewController:alert animated:true completion:NULL];
}

+ (void)alertIn:(nonnull UIViewController *)vc
          title:(nullable NSString *)title
        message:(nullable NSString *)msg
      selection:(nonnull NSArray<NSString *> *)selection
selectionHandler:(nullable void (^)(UIAlertAction * _Nonnull action))selectionHandler {

    if (!vc) return;
    if (!selection.count) return;
    
    __block UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    for (NSString *sel in selection) {
        [alert addAction:[UIAlertAction actionWithTitle:sel style:UIAlertActionStyleDefault handler:selectionHandler]];
    }
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:NULL]];
    
    [vc presentViewController:alert animated:YES completion:NULL];
    
}

+ (void)actionSheetIn:(nonnull UIViewController *)vc
                title:(nullable NSString *)title
              message:(nullable NSString *)msg
            selection:(nonnull NSArray<NSString *> *)selection
     selectionHandler:(nullable void (^)(UIAlertAction * _Nonnull action))selectionHandler {
    
    if (!vc) return;
    if (!selection.count) return;
    
    __block UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (NSString *sel in selection) {
        [alert addAction:[UIAlertAction actionWithTitle:sel style:UIAlertActionStyleDefault handler:selectionHandler]];
    }
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:NULL]];
    
    [vc presentViewController:alert animated:YES completion:NULL];
}

@end
