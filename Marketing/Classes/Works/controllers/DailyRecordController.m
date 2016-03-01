//
//  DailyRecordController.m
//  Marketing
//
//  Created by Hanen 3G 01 on 16/2/29.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//

#import "DailyRecordController.h"

@interface DailyRecordController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  *_tableView;
}
@end

@implementation DailyRecordController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"工作日志";
    self.navigationItem.leftBarButtonItem = [ViewTool getBarButtonItemWithTarget:self WithAction:@selector(recordWork)];
    
    [self addTableView];
}


- (void)addTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 46, KSCreenW, KSCreenH - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //dfdf234324
    return  30;
}
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}
- (void)recordWork
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
