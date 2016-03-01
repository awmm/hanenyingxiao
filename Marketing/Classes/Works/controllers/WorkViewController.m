//
//  WorkViewController.m
//  移动营销
//
//  Created by Hanen 3G 01 on 16/2/23.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//工作主页面

#import "WorkViewController.h"
#import "NoticeViewController.h"
#import "DistributeNoticeController.h"
#import "SignViewController.h"


#import "myButton.h"
#define Space 15.0f

@interface WorkViewController ()<UIScrollViewDelegate>
{
    //页面承载
    UIScrollView  *_mainScrollView;
    
    UIImageView   *_topImageView;
    
    UIView      *_publicView;//公有的视图
    UIView      *_managerView;//管理者才有的视图
    
    BOOL  isManager;//是否为管理者
    
    NSArray     *_titleArr;
    NSArray     *_managerTitleArr;
    
    CGFloat      _lastY;//记录上一个最低的y
    
}
@end

@implementation WorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    _titleArr = [NSArray arrayWithObjects:@"公告",@"签到签退",@"工作日志",@"请假",@"客户地图",@"名片扫描",@"更多",@"",nil];
    _managerTitleArr = [NSArray arrayWithObjects:@"发布公告",@"考勤统计",@"日志查看",@"审批",@"报表",@"人员管控",@"更多",@"", nil];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    isManager = YES;
    
    [self initScrollview];
    [self addTopImage];
    [self creatView];
}

- (void)initScrollview
{
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, KSCreenW, KSCreenH - 49)];
    _mainScrollView.delegate = self;
    _mainScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_mainScrollView];
}

//顶上的图片
- (void)addTopImage
{
    _topImageView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, KSCreenW, [UIView getHeight:130])];
    _topImageView.backgroundColor = [UIColor purpleColor];
    [_mainScrollView addSubview:_topImageView];
    
}
- (void)creatView
{
    [self creatPublicView];
    if(isManager){
        [self addManagerView];//添加管理者特有的视图
    }
}


- (void)creatPublicView
{
    
    CGFloat lineW = 0.8;
    _publicView = [[UIView alloc] initWithFrame:CGRectMake(0, _topImageView.maxY , KSCreenW, [UIView getHeight:140])];
    _publicView.backgroundColor = [UIColor colorWithWhite:0.9  alpha:0.5];
    [_mainScrollView addSubview:_publicView];
    
    UIView *vie1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCreenW, Space)];
    vie1.backgroundColor = grayLineColor;
    
    [_publicView addSubview:vie1];
    
    UILabel * lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, vie1.maxY, _publicView.width, lineW)];
    lineLabel.backgroundColor = [UIColor colorWithWhite:0.85 alpha:0.85];
    [_publicView addSubview:lineLabel];
    
    
    for (int i = 0; i < _titleArr.count; i ++) {
        
        CGFloat row = i / 4;
        CGFloat col = i % 4;
        
        CGFloat btnWidth = (_publicView.width - lineW * 3) / 4;
        CGFloat btnHeight = (_publicView.height - lineW - lineLabel.maxY) / 2.0;
        
        myButton *btn = [[myButton alloc] initWithFrame:CGRectMake(col * (btnWidth + lineW), lineLabel.maxY  + row * (btnHeight + lineW), btnWidth, btnHeight)];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitle:_titleArr[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIView getFontWithSize:12.0f];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn setTitleColor:[UIColor colorWithWhite:0.4 alpha:1] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_publicView addSubview:btn];
        if (i == _titleArr.count - 1) {
            _lastY = btn.maxY;
        }
        
    }
    UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(0, _lastY, _publicView.width, lineW)];
    line2.backgroundColor  = [UIColor colorWithWhite:0.85 alpha:0.85];
    [_publicView addSubview:line2];
    
    
}

- (void)addManagerView
{
    
    CGFloat lineW = 0.8;
    _managerView = [[UIView alloc] initWithFrame:CGRectMake(0, _publicView.maxY , KSCreenW, [UIView getHeight:140])];
    _managerView.backgroundColor = [UIColor colorWithWhite:0.9  alpha:0.5];
    [_mainScrollView addSubview:_managerView];
    
    UIView *vie1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCreenW, Space)];
    vie1.backgroundColor = grayLineColor;
    
    [_managerView addSubview:vie1];
    
    UILabel * lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, vie1.maxY, _publicView.width, lineW)];
    lineLabel.backgroundColor = [UIColor colorWithWhite:0.85 alpha:0.85];
    [_managerView addSubview:lineLabel];
    
    
    for (int i = 0; i < _managerTitleArr.count; i ++) {
        
        CGFloat row = i / 4;
        CGFloat col = i % 4;
        
        CGFloat btnWidth = (_managerView.width - lineW * 3) / 4;
        CGFloat btnHeight = (_managerView.height - lineW - lineLabel.maxY) / 2.0;
        
        myButton *btn = [[myButton alloc] initWithFrame:CGRectMake(col * (btnWidth + lineW), lineLabel.maxY  + row * (btnHeight + lineW), btnWidth, btnHeight)];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitle:_managerTitleArr[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIView getFontWithSize:12.0f];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn setTitleColor:[UIColor colorWithWhite:0.4 alpha:1] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_managerView addSubview:btn];
        if (i == _managerTitleArr.count - 1) {
            _lastY = btn.maxY;
        }
        
    }
    UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(0, _lastY, _managerView.width, lineW)];
    line2.backgroundColor  = [UIColor colorWithWhite:0.85 alpha:0.85];
    [_managerView addSubview:line2];
    
    if (_managerView.maxY > KSCreenH - 49) {
        _mainScrollView.contentSize = CGSizeMake(KSCreenW, _mainScrollView.maxY + 10);
    }
}
#pragma mark --处理按钮点击事件
- (void)handleBtn:(myButton *)btn
{
    if([btn.currentTitle isEqualToString:@"公告"]){
        NoticeViewController *noticeControl = [[NoticeViewController alloc] init];
        [self.navigationController pushViewController:noticeControl animated:YES];
        
    }else if ([btn.currentTitle isEqualToString:@"签到签退"]){
        SignViewController *signVC = [[SignViewController alloc] init];
        [self.navigationController pushViewController:signVC animated:YES];
        
    }else if ([btn.currentTitle isEqualToString:@"工作日志"]){
        
    }else if ([btn.currentTitle isEqualToString:@"请假"]){
        
    }else if ([btn.currentTitle isEqualToString:@"客户地图"]){
        
    }else if ([btn.currentTitle isEqualToString:@"名片扫描"]){
        
    }else if ([btn.currentTitle isEqualToString:@"更多"]){
        
    }else if ([btn.currentTitle isEqualToString:@"发布公告"]){
        DistributeNoticeController * distributeVC = [[DistributeNoticeController alloc] init];
        [self.navigationController pushViewController:distributeVC animated:YES];
    }else if ([btn.currentTitle isEqualToString:@"考勤统计"]){
        
    }else if([btn.currentTitle isEqualToString:@"日志查看"]){
        
    }else if([btn.currentTitle isEqualToString:@"审批"]){
        
    }else if([btn.currentTitle isEqualToString:@"报表"]){
        
    }else if([btn.currentTitle isEqualToString:@"人员管控"]){
        
    }else if([btn.currentTitle isEqualToString:@"更多"] && isManager){
        
    }
}

- (void)viewWillAppear:(BOOL)animated
{
     self.navigationController.navigationBarHidden = YES;
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
