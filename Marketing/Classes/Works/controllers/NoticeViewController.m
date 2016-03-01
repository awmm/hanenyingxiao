//
//  NoticeViewController.m
//  移动营销
//
//  Created by Hanen 3G 01 on 16/2/24.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//公告页

#import "NoticeViewController.h"
#import "NoticeModel.h"
#import "NoticeCell.h"
#import "ManagerNoticeBtnView.h"
#import "NoticeDetailController.h"

@interface NoticeViewController ()<UITableViewDataSource,UITableViewDelegate,ManagerNoticeBtnViewDelegate>
{
    UITableView      * _noticeTableView;
    NSMutableArray   *_dataArray;
    BOOL  isManager;
    BOOL  isOtherNotice;
    int        _pageCount;
}
@property (nonatomic, strong)ManagerNoticeBtnView * topBtnView;
@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _pageCount = 1;
    isManager = YES;
    isOtherNotice = YES;
  
//    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.topBtnView = [[ManagerNoticeBtnView alloc] initWithFrame:CGRectMake(0, 0, [UIView getWidth:200], 44)];
    self.topBtnView.delegate = self;
    if (isManager) {
        self.navigationItem.titleView = self.topBtnView;
        
    }else{
          self.navigationItem.title = @"公告";
    }
  
      [self initData];
    [self initTableView];
  
    
    self.navigationItem.leftBarButtonItem = [ViewTool getBarButtonItemWithTarget:self WithAction:@selector(popLastView)];
}
#pragma mark --获取数据
- (void)initData
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];

    NSString * pages = [NSString stringWithFormat:@"%d",_pageCount];
    int page = [pages intValue];
    NSNumber *number = [NSNumber numberWithInt:page];
//    NSString *rows = [NSString stringWithFormat:<#(nonnull NSString *), ...#>]
    NSNumber *rowsNumber = [NSNumber numberWithInt:20];
    NSDictionary * paramesdictionary = @{@"Token": @"13218001381",@"Uid" : @"5",@"page" : number,@"rows" : rowsNumber};
//    [manager GET:COMMEN_USER_NOTICE_URL parameters:paramesdictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",responseObject);
//        int code = [responseObject[@"code"] intValue];
//        NSLog(@"code :%d",code);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"error : %@",error.localizedDescription);
//    
//    }];
}

- (void)initTableView
{
    _noticeTableView = [[UITableView alloc] initWithFrame:CGRectMake( 0, 64, KSCreenW, KSCreenH - 64) style:UITableViewStylePlain];
    _noticeTableView.delegate = self;
    _noticeTableView.dataSource = self;
    _noticeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _noticeTableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_noticeTableView];
//    self.view.selectedBackgroundView = selcectBackView;
//    selcectBackView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:.1];
    
}

#pragma mark --tableview delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return _dataArray.count;
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NoticeCell * cell = [NoticeCell cellWithTableView:tableView];
//    cell.highlighted = YES;
//     [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [NoticeCell cellHeight];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NoticeDetailController * noticeDetailVC = [[NoticeDetailController alloc] init];
    [self.navigationController pushViewController:noticeDetailVC animated:YES];
    
}
#pragma mark --managerBtnchange delagte
- (void)changeNoticeView:(NSInteger)tag
{
    NSLog(@"24234");
    if (tag == 122) {
        isOtherNotice = YES;
        [self.topBtnView.otherNotice setTitleColor:darkOrangeColor forState:UIControlStateNormal];
        [self.topBtnView.myNotice setTitleColor:[UIColor colorWithWhite:0.4 alpha:1] forState:UIControlStateNormal];
        self.topBtnView.redLine1.backgroundColor = darkOrangeColor;
        self.topBtnView.redLine2.backgroundColor = [UIColor whiteColor];
        
     
        
    }else if (tag == 123){
        isOtherNotice = NO;
        [self.topBtnView.otherNotice setTitleColor:[UIColor colorWithWhite:0.4 alpha:1] forState:UIControlStateNormal];
        [self.topBtnView.myNotice setTitleColor:darkOrangeColor forState:UIControlStateNormal];
        self.topBtnView.redLine1.backgroundColor = [UIColor whiteColor];
        self.topBtnView.redLine2.backgroundColor = darkOrangeColor;
        
    }
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)popLastView
{
    [self.navigationController popViewControllerAnimated:YES];
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
