//
//  ManagerNoticeBtnView.h
//  Marketing
//
//  Created by Hanen 3G 01 on 16/2/26.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ManagerNoticeBtnViewDelegate <NSObject>

- (void)changeNoticeView:(NSInteger)tag;

@end


@interface ManagerNoticeBtnView : UIView
@property (nonatomic, strong) UIButton *otherNotice;
@property (nonatomic, strong) UIView   *redLine1;
@property (nonatomic, strong) UIButton *myNotice;
@property (nonatomic, strong) UIView   *redLine2;
@property (nonatomic, weak) id <ManagerNoticeBtnViewDelegate>delegate;

@end
