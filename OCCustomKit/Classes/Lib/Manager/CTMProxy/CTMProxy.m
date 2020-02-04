//
//  CTMProxy.m
//  test2
//
//  Created by eason on 2019/9/20.
//  Copyright © 2019 fu. All rights reserved.
//

#import "CTMProxy.h"

@implementation CTMProxy

+ (instancetype)proxyWithTarget:(id)target
{
    // NSProxy对象不需要调用init，因为它本来就没有init方法
    CTMProxy *proxy = [CTMProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:self.target];
}

@end
