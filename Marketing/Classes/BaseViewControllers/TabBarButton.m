//
//  TabBarButton.m
//  CSR
//
//  Created by Hanen 3G 01 on 16/2/15.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//

#import "TabBarButton.h"
#define labelRatdio 0.3//button按钮中文字占得高度
@implementation TabBarButton


#pragma mark 设置button内部的image的范围

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW = contentRect.size.width - 20;
    CGRect imageRect = CGRectMake( 10 , 0 , imageW, contentRect.size.height * (1 - labelRatdio));
    return imageRect;
    
}

#pragma mark 设置button内部的title的范围

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
   
    CGRect titleRect = CGRectMake(0, contentRect.size.height - contentRect.size.height * labelRatdio , contentRect.size.width, contentRect.size.height * labelRatdio);
    return titleRect;
}
- (void)setHighlighted:(BOOL)highlighted{
    //    [super setHighlighted:highlighted];
}
@end
