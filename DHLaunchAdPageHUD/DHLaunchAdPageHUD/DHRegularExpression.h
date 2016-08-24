//
//  DHRegularExpression.h
//  DHLaunchAdPageHUDExample
//
//  Created by Apple on 16/8/16.
//  Copyright © 2016年 dingding3w. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHRegularExpression : NSObject
/**
 *  正则表达式验证UserName
 */
+ (BOOL)checkUserName:(NSString *)userName;

/**
 *  正则表达式验证Password
 */
+ (BOOL)checkPassword:(NSString *)password;

/**
 *  正则表达式验证Email
 */
+ (BOOL)checkEmail:(NSString *)email;

/**
 *  正则表达式验证URL
 */
+ (BOOL)checkURL:(NSString *)url;

/**
 *  正则表达式验证TelephoneNumber
 */
+ (BOOL)checkTelephoneNumber:(NSString *)telephoneNumber;
@end
