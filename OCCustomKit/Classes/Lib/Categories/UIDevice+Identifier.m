//
//  UIDevice+Identifier.m
//  OC_FM
//
//  Created by eason on 2018/7/19.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "UIDevice+Identifier.h"
#import <sys/sysctl.h>
#import <sys/utsname.h>
#import <objc/runtime.h>

#define kDeviceIdentifierID @"deviceIdentifierID"

#define TT_FIX_CATEGORY_BUG(name) @interface TT_FIX_CATEGORY_BUG_##name @end \
@implementation TT_FIX_CATEGORY_BUG_##name @end

static void * const kUIDeviceIdentifierIDKey     = (void*)&kUIDeviceIdentifierIDKey;

@implementation UIDevice (Identifier)

+ (CGSize)deviceScreenSize {
    return [UIScreen mainScreen].currentMode.size;
}

+ (NSArray *)runningProcesses {
    
    int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_ALL, 0};
    u_int miblen = 4;
    
    size_t size;
    int st = sysctl(mib, miblen, NULL, &size, NULL, 0);
    
    struct kinfo_proc * process = NULL;
    struct kinfo_proc * newprocess = NULL;
    
    do {
        
        size += size / 10;
        newprocess = realloc(process, size);
        
        if (!newprocess){
            
            if (process){
                free(process);
            }
            
            return nil;
        }
        
        process = newprocess;
        st = sysctl(mib, miblen, process, &size, NULL, 0);
        
    } while (st == -1 && errno == ENOMEM);
    
    if (st == 0){
        
        if (size % sizeof(struct kinfo_proc) == 0){
            NSInteger nprocess = size / sizeof(struct kinfo_proc);
            
            if (nprocess){
                
                NSMutableArray * array = [[NSMutableArray alloc] init];
                
                for (NSInteger i = nprocess - 1; i >= 0; i--){
                    
                    NSString * processID = [[NSString alloc] initWithFormat:@"%d", process[i].kp_proc.p_pid];
                    NSString * processName = [[NSString alloc] initWithFormat:@"%s", process[i].kp_proc.p_comm];
                    NSString * processCPU = [[NSString alloc] initWithFormat:@"%d", process[i].kp_proc.p_estcpu];
                    double t = [[NSDate date] timeIntervalSince1970] - process[i].kp_proc.p_un.__p_starttime.tv_sec;
                    NSString * processUseTime = [[NSString alloc] initWithFormat:@"%f",t];
                    NSDictionary * dict = [[NSDictionary alloc] initWithObjects:@[ processID, processName, processCPU, processUseTime ]
                                                                        forKeys:@[ @"ProcessID", @"ProcessName", @"processCPU", @"processUseTime" ]];
                    [array addObject:dict];
                }
                
                free(process);
                return array;
            }
        }
    }
    
    return nil;
}

#pragma mark -
#pragma mark - 获取设备具体型号
+ (NSString *)getDeviceModel
{
    struct utsname u;
    uname(&u);
    NSString *machine = [[NSString alloc] initWithUTF8String:u.machine];
    
    //iPhone
    if ([machine isEqualToString:@"iPhone2,1"])
    return @"iPhone 3GS";
    if ([machine isEqualToString:@"iPhone3,1"] || [machine isEqualToString:@"iPhone3,2"] || [machine isEqualToString:@"iPhone3,3"])
    return @"iPhone 4";
    if ([machine isEqualToString:@"iPhone4,1"])
    return @"iPhone 4S";
    if ([machine isEqualToString:@"iPhone5,1"] || [machine isEqualToString:@"iPhone5,2"])
    return @"iPhone 5";
    if ([machine isEqualToString:@"iPhone5,3"] || [machine isEqualToString:@"iPhone5,4"])
    return @"iPhone 5C";
    if ([machine isEqualToString:@"iPhone6,1"] || [machine isEqualToString:@"iPhone6,2"])
    return @"iPhone 5S";
    if ([machine isEqualToString:@"iPhone7,1"])
    return @"iPhone 6Plus";
    if ([machine isEqualToString:@"iPhone7,2"])
    return @"iPhone 6";
    if ([machine isEqualToString:@"iPhone7,1"])
    return @"iPhone 6Plus";
    if ([machine isEqualToString:@"iPhone8,1"])
    return @"iPhone 6s";
    if ([machine isEqualToString:@"iPhone8,2"])
    return @"iPhone 6sPlus";
    if ([machine isEqualToString:@"iPhone9,1"] || [machine isEqualToString:@"iPhone9,3"])
    return @"iPhone 7";
    if ([machine isEqualToString:@"iPhone9,2"] || [machine isEqualToString:@"iPhone9,4"])
    return @"iPhone 7 Plus";
    if ([machine isEqualToString:@"iPhone8,4"])
    return @"iPhone SE";
    if ([machine isEqualToString:@"iPhone10,1"] || [machine isEqualToString:@"iPhone10,4"])
    return @"iPhone 8";
    if ([machine isEqualToString:@"iPhone10,2"] || [machine isEqualToString:@"iPhone10,5"])
    return @"iPhone 8 Plus";
    if ([machine isEqualToString:@"iPhone10,3"] || [machine isEqualToString:@"iPhone10,6"])
    return @"iPhone X";
    if ([machine isEqualToString:@"iPhone11,8"])
    return @"iPhone XR";
    if ([machine isEqualToString:@"iPhone11,2"])
    return @"iPhone XS";
    if ([machine isEqualToString:@"iPhone11,4"] || [machine isEqualToString:@"iPhone11,6"])
    return @"iPhone XS Max";
    if ([machine isEqualToString:@"iPhone12,1"])
    return @"iPhone 11";
    if ([machine isEqualToString:@"iPhone12,3"])
    return @"iPhone 11 Pro";
    if ([machine isEqualToString:@"iPhone12,5"])
    return @"iPhone 11 Pro Max";
    
    //iPad
    if ([machine isEqualToString:@"iPad1,1"])
    return @"iPad 1";
    if ([machine isEqualToString:@"iPad2,1"] || [machine isEqualToString:@"iPad2,2"] || [machine isEqualToString:@"iPad2,3"] || [machine isEqualToString:@"iPad2,4"] )
    return @"iPad 2";
    if ([machine isEqualToString:@"iPad3,1"] || [machine isEqualToString:@"iPad3,2"] || [machine isEqualToString:@"iPad3,3"])
    return @"iPad 3";
    if ([machine isEqualToString:@"iPad3,4"] || [machine isEqualToString:@"iPad3,5"] || [machine isEqualToString:@"iPad3,6"])
    return @"iPad 4";
    if ([machine isEqualToString:@"iPad6,11"] || [machine isEqualToString:@"iPad6,12"])
    return @"iPad 5";
    if ([machine isEqualToString:@"iPad4,1"] || [machine isEqualToString:@"iPad4,2"] || [machine isEqualToString:@"iPad4,3"])
    return @"iPad Air";
    if ([machine isEqualToString:@"iPad5,3"] || [machine isEqualToString:@"iPad5,4"] )
    return @"iPad Air 2";
    if ([machine isEqualToString:@"iPad11,3"] || [machine isEqualToString:@"iPad11,4"] )
    return @"iPad Air 3";
    if ([machine isEqualToString:@"iPad2,5"] || [machine isEqualToString:@"iPad2,6"] || [machine isEqualToString:@"iPad2,7"])
    return @"iPad Mini";
    if ([machine isEqualToString:@"iPad4,4"] || [machine isEqualToString:@"iPad4,5"] || [machine isEqualToString:@"iPad4,6"])
    return @"iPad Mini 2";
    if ([machine isEqualToString:@"iPad4,7"] || [machine isEqualToString:@"iPad4,8"] || [machine isEqualToString:@"iPad4,9"])
    return @"iPad Mini 3";
    if ([machine isEqualToString:@"iPad5,1"] || [machine isEqualToString:@"iPad5,2"])
    return @"iPad Mini 4";
    if ([machine isEqualToString:@"iPad11,1"] || [machine isEqualToString:@"iPad11,2"])
    return @"iPad Mini 5";
    if ([machine isEqualToString:@"iPad6,3"] || [machine isEqualToString:@"iPad6,4"])
    return @"iPad Pro 9.7 Inch";
    if ([machine isEqualToString:@"iPad6,7"] || [machine isEqualToString:@"iPad6,8"])
    return @"iPad Pro 12.9 Inch";
    if ([machine isEqualToString:@"iPad7,1"] || [machine isEqualToString:@"iPad7,2"])
    return @"iPad Pro 12.9 Inch 2. Generation";
    if ([machine isEqualToString:@"iPad7,3"] || [machine isEqualToString:@"iPad7,4"])
    return @"iPad Pro 10.5 Inch";
    if ([machine isEqualToString:@"iPad8,5"] || [machine isEqualToString:@"iPad8,6"] || [machine isEqualToString:@"iPad8,7"] || [machine isEqualToString:@"iPad8,8"])
    return @"iPad Pro 12.9-inch 3rd";
    if ([machine isEqualToString:@"iPad8,1"] || [machine isEqualToString:@"iPad8,2"] || [machine isEqualToString:@"iPad8,3"] || [machine isEqualToString:@"iPad8,4"])
    return @"iPad Pro 11-inch";
    
    //iPod
    if ([machine isEqualToString:@"iPod1,1"])
    return @"iPod Touch 1";
    if ([machine isEqualToString:@"iPod2,1"])
    return @"iPod Touch 2";
    if ([machine isEqualToString:@"iPod3,1"])
    return @"iPod Touch 3";
    if ([machine isEqualToString:@"iPod4,1"])
    return @"iPod Touch 4";
    if ([machine isEqualToString:@"iPod5,1"])
    return @"iPod Touch 5";
    if ([machine isEqualToString:@"iPod7,1"])
    return @"iPod Touch 6";
    
    //AppleTV
    if ([machine isEqualToString:@"AppleTV2,1"])
    return @"Apple TV 2G";
    if ([machine isEqualToString:@"AppleTV3,1"])
    return @"Apple TV 3";
    if ([machine isEqualToString:@"AppleTV3,2"])
    return @"Apple TV 3 (2013)";
    if ([machine isEqualToString:@"AppleTV5,3"])
    return @"Apple TV HD";
    if ([machine isEqualToString:@"AppleTV6,2"])
    return @"Apple TV 4K";
    
    // HomePod
    if ([machine isEqualToString:@"AudioAccessory1,1"])
    return @"HomePod";
    
    //Simulator
    if ([machine isEqualToString:@"i386"] || [machine isEqualToString:@"x86_64"])
    return @"Simulator";
    
    //避免出现新机型 上面罗列不全是
    if ([machine hasPrefix:@"iPhone"]) {
        return @"iPhone";
    }
    
    if ([machine hasPrefix:@"iPad"]) {
        return @"iPad";
    }
    
    return @"iPhone";
}

@end
