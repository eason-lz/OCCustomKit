//
//  UIButton+ExpandTheClickArea.h
//  Pods
//
//  Created by GoodSir on 2020/6/27.
//
//  扩大按钮的点击区域

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (ExpandTheClickArea)

- (void)setEnlargeEdge:(CGFloat)size;

- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

@end

NS_ASSUME_NONNULL_END
