//
//  UITextView+Placeholder.h
//  OC_FM
//
//  Created by eason on 2018/7/19.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Placeholder)

-(void)setPlaceholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor;
- (void)addAccessoryButtonWithTitle:(NSString *)title
                             target:(id)target
                             action:(SEL)action;

@end
