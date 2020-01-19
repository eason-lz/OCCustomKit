//
//  UIDevice+Identifier.h
//  OC_FM
//
//  Created by eason on 2018/7/19.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Identifier)

+ (CGSize)deviceScreenSize;

+ (NSArray *)runningProcesses;

+ (NSString *)getDeviceModel;

@end
