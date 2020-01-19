//
//  CALayer+IBKeyPath.h
//  OC_FM
//
//  Created by eason on 2018/7/19.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (IBKeyPath)

@property (nonatomic, strong) UIColor * boardColorFromUIcolor;      /**< 通过UIColor设置layer的描边色*/

@property (nonatomic, strong) UIColor * shadowColorFromUIcolor;     /**< 通过UIColor设置layer的阴影颜色 */

@end
