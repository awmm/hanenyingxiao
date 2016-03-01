//
//  VisitingViewController.m
//  移动营销
//
//  Created by Hanen 3G 01 on 16/2/23.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//

#import "VisitingViewController.h"
#import "CKCalendarView.h"
#import "CRM_PrefixHeader.pch"
#import "VisitTableViewCell.h"

@interface VisitingViewController ()

@end

@implementation VisitingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.hidesBackButton =YES;
    CGFloat statusBarHeight = 0;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
    {
        statusBarHeight = 20;
    }
    
    
    NSString *type = [[[NSUserDefaults standardUserDefaults] objectForKey:@"type"] stringValue];

    if ([type isEqualToString:@"2"]) {
        
        self.navigationItem.title = @"";

//        UIToolbar* tools = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, KSCreenW, 44)];
//        [tools setTintColor:[self.navigationController.navigationBar tintColor]];
//        [tools setAlpha:[self.navigationController.navigationBar alpha]];
//        NSMutableArray* buttons = [[NSMutableArray alloc] initWithCapacity:2];
//        
//        UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"下属拜访" style:UIBarButtonItemStylePlain
//                                                                                       target:self action:@selector(clickSettings:)];
//        
//        anotherButton.
//        UIBarButtonItem *anotherButton1 = [[UIBarButtonItem alloc] initWithTitle:@"我的拜访" style:UIBarButtonItemStylePlain
//                                                                          target:self action:@selector(clickEdit:)];
//        [buttons addObject:anotherButton];
//        [buttons addObject:anotherButton1];
//        [tools setItems:buttons animated:NO];
        
        
        UIButton *subordinateBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [subordinateBtn setTitle:NSLocalizedString(@"下属拜访", nil) forState:UIControlStateNormal];
        [subordinateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [subordinateBtn.titleLabel setFont:[UIFont systemFontOfSize:24]];
        subordinateBtn.frame = CGRectMake(10, statusBarHeight, KSCreenW/2-20, 44);
        [subordinateBtn addTarget:self action:@selector(changeVisit) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:subordinateBtn];
        
        UIButton *mineBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [mineBtn setTitle:NSLocalizedString(@"我的拜访", nil) forState:UIControlStateNormal];
        [mineBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [mineBtn.titleLabel setFont:[UIFont systemFontOfSize:24]];
        mineBtn.frame = CGRectMake(KSCreenW/2, statusBarHeight, KSCreenW/2-20, 44);
        [mineBtn addTarget:self action:@selector(changeVisit) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:mineBtn];

        
        UIBarButtonItem *addVisitBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add"] style:UIBarButtonItemStylePlain target:self action:@selector(addVisit)];
        
        self.navigationItem.rightBarButtonItem = addVisitBtn;
//        UIBarButtonItem *myBtn = [[UIBarButtonItem alloc] initWithCustomView:tools];
//        self.navigationItem.rightBarButtonItem = myBtn;
        
    }else{
        self.navigationItem.title = @"我的拜访";
    }
    
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startSunday frame:CGRectMake(0, statusBarHeight+44, KSCreenW, 300)];//开始日期
//    calendar.frame = CGRectMake(0, statusBarHeight+44, KSCreenW, 300);
    [self.view addSubview:calendar];
    
}


- (void)changeVisit{
    NSLog(@"1111");
}

- (void)addVisit{
    NSLog(@"2222");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
    static NSString *CellIdentifier = @"ExchangeTableViewCell";
    VisitTableViewCell *cell = (VisitTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[ExchangeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    
//    cell.excImageView.image = [UIImage imageNamed:_excImageArr[indexPath.row]];
//    cell.excNameLab.text = _excNameArr[indexPath.row];
//    cell.excCodeLab.text = _excCodeArr[indexPath.row];
//    cell.excValidityLab.text = _excValidityArr[indexPath.row];
//    cell.excIntegralLab.text = _excIntegralArr[indexPath.row];
//    
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
