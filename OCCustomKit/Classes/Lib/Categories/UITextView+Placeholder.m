//
//  UITextView+Placeholder.m
//  OC_FM
//
//  Created by eason on 2018/7/19.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "UITextView+Placeholder.h"

@implementation UITextView (Placeholder)

-(void)setPlaceholder:(NSString *)placeholdStr placeholdColor:(UIColor *)placeholdColor
{
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = placeholdStr;
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = placeholdColor;
    placeHolderLabel.font = self.font;
    [placeHolderLabel sizeToFit];
    [self addSubview:placeHolderLabel];
    
    /*
     [self setValue:(nullable id) forKey:(nonnull NSString *)]
     ps: KVC键值编码，对UITextView的私有属性进行修改
     */
    [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
}

- (void)addAccessoryButtonWithTitle:(NSString *)title
                             target:(id)target
                             action:(SEL)action {
    
    UIBarButtonItem *bbiSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *bbiBtn = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    
    UIToolbar *tb = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
    tb.barTintColor = [UIColor whiteColor];
    tb.items = @[bbiSpace, bbiBtn];
    self.inputAccessoryView = tb;
}

@end
