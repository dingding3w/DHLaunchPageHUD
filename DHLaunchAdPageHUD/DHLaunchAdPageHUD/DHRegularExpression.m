//
//  DHRegularExpression.m
//  DHLaunchAdPageHUDExample
//
//  Created by Apple on 16/8/16.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import "DHRegularExpression.h"

@implementation DHRegularExpression
/**< BOOL类型非0为真,0为假 */
+ (BOOL)checkUserName:(NSString *)userName {
    NSString *regex   = @"(^[A-Za-z0-9]{3,20}$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:userName];
}

+ (BOOL)checkPassword:(NSString *)password {
    NSString *regex   = @"(^[A-Za-z0-9]{6,20}$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:password];
}

+ (BOOL)checkEmail:(NSString *)email {
    NSString *regex   = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:email];
}

+ (BOOL)checkURL:(NSString *)url {
    NSString *regex   = @"http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:url];
}

+ (BOOL)checkTelephoneNumber:(NSString *)telephoneNumber {
    NSString *MOBILE             = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString *CM                 = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString *CU                 = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString *CT                 = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSString *PHS                = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct     = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs    = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    return [regextestmobile evaluateWithObject:telephoneNumber] || [regextestphs evaluateWithObject:telephoneNumber] || [regextestct evaluateWithObject:telephoneNumber] || [regextestcu evaluateWithObject:telephoneNumber] || [regextestcm evaluateWithObject:telephoneNumber];
}
@end
