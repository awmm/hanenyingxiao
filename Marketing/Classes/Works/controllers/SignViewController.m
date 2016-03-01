//
//  SignViewController.m
//  移动营销
//
//  Created by Hanen 3G 01 on 16/2/24.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//签到 签退 页面

#import "SignViewController.h"
#import "PostSignInViewController.h"



#define TopSpace [UIView getWidth:10.0f]

@interface SignViewController ()
{
    UIView  *_userInfoView;//承载个人信息的view
    UIImageView *_imageView;//头像
    UILabel     *_nameLabel;//名字
    UILabel     *_signInLable;//签到状态
    UILabel     *_signOutLabel;//签退状态
    UILabel     *_dateLabel;//日期
    UILabel     *_timeLabel;//当前时间
    
      //定位信息
    UIView      *_PlaceView;
    UIImageView *_placeImage;
    UILabel     *_placeNameLabel;
    UILabel     *_placeLocalLabel;
    UIButton    *_changePlaceBtn;
    
    UIButton    *_signInBtn;
    UIButton    *_signOutBtn;
    UIView      *_signBtnView;
    
    //今天的日期信息
    NSString    *_dateString;
    NSString    *_timeString;
    NSString    *_weekDayString;
    
    NSTimer     *_timer;
    
}

@end

@implementation SignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"签到签退";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getCrrentDate];
    [self creatInfoView];//加上个人签到签退 时间日期视图
    [self creatPlaceInfoView];//加上地理位置视图
    [self creatSignBtnView];//签到 签退按钮
    
    self.navigationItem.leftBarButtonItem = [ViewTool getBarButtonItemWithTarget:self WithAction:@selector(popLastView)];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(freshTime) userInfo:nil repeats:YES];
}

- (void)creatInfoView
{
    
    CGFloat imageW = 80;

    _userInfoView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, KSCreenW, [UIView getHeight:133])];
//    _userInfoView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_userInfoView];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(TopSpace * 2,  TopSpace, imageW, imageW)];
    _imageView.backgroundColor = [UIColor blackColor];
    _imageView.layer.cornerRadius = imageW / 2.0;
    _imageView.layer.masksToBounds = YES;
    [_userInfoView addSubview:_imageView];
    
    //名字根据用户登录来获取
    _nameLabel = [ViewTool getLabelWith:CGRectMake(_imageView.maxX + 2 * TopSpace, TopSpace, 100, [UIView getHeight:20]) WithTitle:@"小花花" WithFontSize:16.0 WithTitleColor:[UIColor colorWithWhite:0.5    alpha:1] WithTextAlignment:NSTextAlignmentLeft];
//    _nameLabel.backgroundColor = [UIColor redColor];
    [_userInfoView addSubview:_nameLabel];
    
    //根据签到签退的情况来 改变label文字的状态
    _signInLable = [ViewTool getLabelWith:CGRectMake(_nameLabel.x, _nameLabel.maxY + 5, 100, [UIView getHeight:15]) WithTitle:nil WithFontSize:13.0f WithTitleColor:[UIColor lightGrayColor] WithTextAlignment:NSTextAlignmentLeft];
//    _signInLable.backgroundColor = [UIColor orangeColor];
    _signInLable.text = @"已签到";
    [_userInfoView addSubview:_signInLable];
    
    
    _signOutLabel = [ViewTool getLabelWith:CGRectMake(_nameLabel.x, _signInLable.maxY + 5, 100, [UIView getHeight:15]) WithTitle:nil WithFontSize:13.0f WithTitleColor:[UIColor lightGrayColor] WithTextAlignment:NSTextAlignmentLeft];
//    _signOutLabel.backgroundColor = [UIColor blueColor];
    _signOutLabel.text = @"已签退";
    [_userInfoView addSubview:_signOutLabel];
    
    //添加虚线
    UIView *line = [ViewTool getLineViewWith:CGRectMake(_imageView.x, _imageView.maxY + 5, KSCreenW - 4 * TopSpace, 0.8) withBackgroudColor:[UIColor colorWithWhite:0.7 alpha:0.8]];
    [_userInfoView addSubview:line];
    
    //添加 日期 时间
    
    UIImageView *dateImageView = [[UIImageView alloc] initWithFrame:CGRectMake( _imageView.x, line.maxY + 2 * TopSpace, 20, 20)];
    dateImageView.backgroundColor = [UIColor orangeColor];
    [_userInfoView addSubview:dateImageView];
    
//
    NSMutableAttributedString * dateStr = [[NSMutableAttributedString alloc] initWithString:_dateString];
    [dateStr setAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName : [UIColor colorWithWhite:0.4 alpha:0.85]} range:NSMakeRange(0, _dateString.length)];
    [dateStr setAttributes:@{NSFontAttributeName : [UIView getFontWithSize:12.0f],NSForegroundColorAttributeName : [UIColor colorWithWhite:0.7 alpha:0.85]} range:NSMakeRange(4, _dateString.length - 4)];
    _dateLabel = [ViewTool getLabelWithFrame:CGRectMake(dateImageView.maxX + TopSpace, dateImageView.y, [UIView getWidth:110], dateImageView.height) WithAttrbuteString:dateStr];
    _dateLabel.backgroundColor = [UIColor redColor];
    [_userInfoView addSubview:_dateLabel];
    
    
    UIImageView *timeImageView = [[UIImageView alloc] initWithFrame:CGRectMake( self.view.width / 2.0 + TopSpace, dateImageView.y, 20, 20)];
    timeImageView.backgroundColor = [UIColor orangeColor];
    [_userInfoView addSubview:timeImageView];
    
     NSMutableAttributedString * timeStr = [[NSMutableAttributedString alloc] initWithString:_timeString];
    [timeStr setAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName : [UIColor colorWithWhite:0.4 alpha:0.85]} range:NSMakeRange(0, _timeString.length)];
    [timeStr setAttributes:@{NSFontAttributeName : [UIView getFontWithSize:12.0f],NSForegroundColorAttributeName : [UIColor colorWithWhite:0.7 alpha:0.85]} range:NSMakeRange(5, _timeString.length - 5)];
    _timeLabel = [ViewTool getLabelWithFrame:CGRectMake(timeImageView.maxX + TopSpace, timeImageView.y, [UIView getWidth:100], timeImageView.height)  WithAttrbuteString:timeStr];
    [_userInfoView addSubview:_timeLabel];
    
    UIView *line2 = [ViewTool getLineViewWith:CGRectMake(_imageView.x, _timeLabel.maxY + 2 * TopSpace, KSCreenW - 4 * TopSpace, 0.8) withBackgroudColor:[UIColor colorWithWhite:0.7 alpha:0.8]];
    [_userInfoView addSubview:line2];
    NSLog(@"%@",NSStringFromCGRect(line2.frame));
    _userInfoView.frame = CGRectMake(0, 64, KSCreenW, line2.maxY);
 
}

- (void)creatPlaceInfoView
{
    _PlaceView = [[UIView alloc] initWithFrame:CGRectMake(0, _userInfoView.maxY, KSCreenW, 90)];
//    _PlaceView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_PlaceView];
    
    _placeImage = [[UIImageView alloc] initWithFrame:CGRectMake(2 * TopSpace, TopSpace, [UIView getWidth:80], _PlaceView.height - 2 * TopSpace)];
    _placeImage.backgroundColor = [UIColor orangeColor];
    [_PlaceView addSubview:_placeImage];
    
    _placeNameLabel = [ViewTool getLabelWith:CGRectMake(_placeImage.maxX + TopSpace, _placeImage.y, KSCreenW - _placeImage.maxX - 2 * TopSpace, 20) WithTitle:@"付电费和巨额花费" WithFontSize:15.0f WithTitleColor:[UIColor colorWithWhite:0.5 alpha:0.85] WithTextAlignment:NSTextAlignmentLeft];
    [_PlaceView addSubview:_placeNameLabel];
    
    _placeLocalLabel = [ViewTool getLabelWith:CGRectMake(_placeImage.maxX + TopSpace, _placeNameLabel.maxY + 5, KSCreenW - _placeImage.maxX - 2 * TopSpace, 15) WithTitle:@"fhdjfhdjfjd" WithFontSize:13.0 WithTitleColor:[UIColor colorWithWhite:0.7 alpha:0.8] WithTextAlignment:NSTextAlignmentLeft];
    [_PlaceView addSubview:_placeLocalLabel];
    
    _changePlaceBtn = [[UIButton alloc] initWithFrame:CGRectMake(_placeImage.maxX + TopSpace, _placeLocalLabel.maxY + 5, [UIView getWidth:120], 15)];
    [_changePlaceBtn setTitle:@"地点不准？点我微调" forState:UIControlStateNormal];
//    _changePlaceBtn.backgroundColor = [UIColor redColor];
    _changePlaceBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [_changePlaceBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    _changePlaceBtn.titleLabel.font = [UIView getFontWithSize:12.0f];
    [_changePlaceBtn addTarget:self action:@selector(changePlace:) forControlEvents:UIControlEventTouchUpInside];
    [_PlaceView addSubview:_changePlaceBtn];
    
    UIView *line2 = [ViewTool getLineViewWith:CGRectMake(_placeImage.x, _placeImage.maxY +  TopSpace, KSCreenW - 4 * TopSpace, 1) withBackgroudColor:[UIColor colorWithWhite:0.7 alpha:0.8]];
    [_PlaceView addSubview:line2];
    _PlaceView.frame = CGRectMake(0, _userInfoView.maxY, KSCreenW, line2.maxY);
}


- (void)creatSignBtnView
{
    _signBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, _PlaceView.maxY, KSCreenW, KSCreenH - _PlaceView.maxY)];
//    _signBtnView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_signBtnView];
    
    CGFloat btnW = [UIView getWidth:80];
    _signInBtn = [[UIButton alloc] initWithFrame:CGRectMake(_signBtnView.width / 2.0 - btnW - 3 * TopSpace, _signBtnView.height / 2.0 - btnW/2.0 - 2 * TopSpace, btnW, btnW)];
    _signInBtn.tag = 100;
    _signInBtn.layer.cornerRadius = btnW / 2.0;
    _signInBtn.layer.masksToBounds = YES;
    _signInBtn.backgroundColor = darkOrangeColor;
    [_signInBtn addTarget:self action:@selector(signInOrSignOut:) forControlEvents:UIControlEventTouchUpInside];
    [_signBtnView addSubview:_signInBtn];
    
    _signOutBtn = [[UIButton alloc] initWithFrame:CGRectMake(_signBtnView.width / 2.0  + 3 * TopSpace, _signBtnView.height / 2.0 - btnW/2.0 - 2 * TopSpace, btnW, btnW)];
    _signOutBtn.tag = 101;
    _signOutBtn.layer.cornerRadius = btnW / 2.0;
    _signOutBtn.layer.masksToBounds = YES;
    _signOutBtn.backgroundColor =  yellowBgColor;
    [_signBtnView addSubview:_signOutBtn];
}

//签到 签退
- (void)signInOrSignOut:(UIButton *)sender
{
    if (sender.tag == 100) {
        PostSignInViewController *postSignVC = [[PostSignInViewController alloc] init];
        postSignVC.currentTime = [_timeString substringFromIndex:5];
        postSignVC.currentPlace = @"湖南路狮子桥美食街100000号烤的就是你";
        [self.navigationController pushViewController:postSignVC animated:YES];
    }
}

//更改地址
- (void)changePlace:(UIButton * )sender
{
    
}

#pragma mark --刷新时间
- (void)freshTime
{
    [self getCrrentDate];
}
- (void)getCrrentDate
{
  NSString * str = [DateTool getCurrentDate];
    NSRange  range = [str rangeOfString:@" "];
    NSString * dateStr = [str substringWithRange:NSMakeRange(0, range.location - 1)];
    NSString * timeStr = [str substringFromIndex:range.location];
    _dateString = [NSString stringWithFormat:@"%@:%@",[DateTool getCurrentWeekDay],dateStr];
    _timeString = [NSString stringWithFormat:@"当前时间:%@",timeStr];
    NSLog(@"%@,%@",_dateString,_timeString);

    _timeLabel.text = _timeString;
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
