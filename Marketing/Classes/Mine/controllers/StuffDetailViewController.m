//
//  StuffDetailViewController.m
//  Marketing
//
//  Created by HanenDev on 16/2/26.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//

#import "StuffDetailViewController.h"
#import "InformationCell.h"

@interface StuffDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray      *_titleArray;
    UITableView  *_tableView;
}
@end

@implementation StuffDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _titleArray = @[@"所属部门",@"职位"];
    
    [self createUI];
}
- (void)createUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSCreenW, KSCreenH - 49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 80.0f;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    
    CGFloat bgImageH     = 260;//背景图片的高度
    CGFloat headerImageW  = 100;//头像尺寸
    CGFloat qrSpace      = 15;
    CGFloat qrW          = 40;
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KSCreenW, bgImageH)];
    headerView.backgroundColor = [UIColor grayColor];
    
    UIImageView *bgImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KSCreenW, bgImageH)];
    bgImage.image = [UIImage imageNamed:@""];
    [headerView addSubview:bgImage];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, KSCreenW, 40)];
    _nameLabel.text = @"小花花";
    _nameLabel.textColor = [UIColor redColor];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:_nameLabel];
    
    _headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake((KSCreenW-headerImageW)/2, _nameLabel.maxY + 10, headerImageW, headerImageW)];
    _headerImageView.backgroundColor = [UIColor blueColor];
    _headerImageView.layer.cornerRadius = headerImageW/2;
    _headerImageView.layer.masksToBounds = YES;
    _headerImageView.image = [UIImage imageNamed:@""];
    [headerView addSubview:_headerImageView];
    
    UIImageView *photoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(_headerImageView.maxX - 20, _headerImageView.maxY -20 , 20, 20)];
    photoImageView.image =[UIImage imageNamed:@"相机"];
    [headerView addSubview:photoImageView];
    
    //拨打电话按钮
    UIButton *phoneBtn = [[UIButton alloc]initWithFrame:CGRectMake(_headerImageView.x - 30, _headerImageView.maxY + 10, 30, 30)];
    [phoneBtn setImage:[UIImage imageNamed:@"电话2"] forState:UIControlStateNormal];
    [phoneBtn addTarget:self action:@selector(directCall:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:phoneBtn];
    
    _phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(phoneBtn.maxX + 10, phoneBtn.y - 8, KSCreenW, 40)];
    _phoneLabel.text = @"13911119999";
    _phoneLabel.textColor=[UIColor redColor];
    //_phoneLabel.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:_phoneLabel];
    
    _qrBtn = [[UIButton alloc]initWithFrame:CGRectMake(KSCreenW - qrW - qrSpace, qrSpace, qrW, qrW)];
    [_qrBtn setImage:[UIImage imageNamed:@"二维码"] forState:UIControlStateNormal];
    [_qrBtn addTarget:self action:@selector(getQRcode:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_qrBtn];
    
    _tableView.tableHeaderView = headerView;
}
//二维码扫描
- (void)getQRcode:(UIButton *)btn{
    NSLog(@"");
}
- (void)directCall:(UIButton *)sender{
    
    UIWebView *webview = [[UIWebView alloc] init];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",_phoneLabel.text]]]];
    [self.view addSubview:webview];
}
#pragma mark
#pragma mark---------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    InformationCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell=[[InformationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.titleLabel.text = _titleArray[indexPath.row];
    if (indexPath.row == 0) {
         cell.subLabel.text =@"移动设计院";
    }else if (indexPath.row == 1){
        cell.subLabel.text =@"项目经理";
    }
    
    return cell;
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
