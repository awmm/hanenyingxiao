//
//  DataTool.h
//  Marketing
//
//  后端返回的数据中总会出现一些NSNull类型，当我们一处理程序就会崩溃，因此想到把返回的数据中的NSNull类型全部转换成@""空字符串。
//  Created by wmm on 16/2/26.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataTool : NSObject

+(id)changeType:(id)myObj;

+ (void)login:(NSString *)username withPass:(NSString *)password fromView:(UIViewController *)viewController;

@end
