//
//  BusinessAdressBookVC.m
//  Marketing
//
//  Created by HanenDev on 16/2/25.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//

#import "BusinessAdressBookVC.h"

@interface BusinessAdressBookVC ()

@end

@implementation BusinessAdressBookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"企业通讯录";
    NSLog(@"");
    
    [self createUI];
}
- (void)createUI{
    
    UIButton *backBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 25)];
    [backBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    //[backBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    [backBtn addTarget:self action:@selector(goToBack) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    UIButton *addBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [addBtn setImage:[UIImage imageNamed:@"新建"] forState:UIControlStateNormal];
    //[backBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    [addBtn addTarget:self action:@selector(addNewPeople) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:addBtn];
    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, KSCreenW, 40)];
    searchBar.placeholder = @"搜索";
    [self.view addSubview:searchBar];
    
    [self initTableView];
}
- (void)initTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+40, KSCreenW, KSCreenH - 64 -40)];
    
    
    [self.view addSubview:tableView];
}
- (void)goToBack{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)addNewPeople{
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.hidesBottomBarWhenPushed = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
