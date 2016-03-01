//
//  VisitTableViewCell.m
//  Marketing
//
//  Created by wmm on 16/2/29.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//

#import "VisitTableViewCell.h"
#import "CRM_PrefixHeader.pch"

@implementation VisitTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.clipsToBounds = YES;
        //选中单元格
        //        UIView *bgView = [[UIView alloc] init];
        //        bgView.backgroundColor = [UIColor colorWithRed:(20.0f/255.0f) green:(30.0f/255.0f) blue:(40.0f/255.0f) alpha:0.5f];
        //        self.selectedBackgroundView = bgView;
        
        self.imageView.contentMode = UIViewContentModeCenter;
        
    
        
        
        self.companyLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, KSCreenW/2, 20)];
        self.companyLab.font = [UIFont systemFontOfSize:16];
        self.companyLab.textColor = grayLineColor;
        
        UIImageView *companyLevelImage = [[UIImageView alloc] initWithFrame:CGRectMake(KSCreenW/2+10, 10, 20, 20)];
        companyLevelImage.image = [UIImage imageNamed:@"int_Jifen"];
        
        self.visitTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(KSCreenW-70, 10, 50, 20)];
        self.visitTimeLab.font = [UIFont systemFontOfSize:13];
        self.visitTimeLab.textColor = grayLineColor;
        
        UIImageView *addressImage = [[UIImageView alloc] initWithFrame:CGRectMake(KSCreenW/2+10, 10, 20, 20)];
        addressImage.image = [UIImage imageNamed:@"int_Jifen"];
        
        self.companyLab = [[UILabel alloc] initWithFrame:CGRectMake(KSCreenW-70, 10, KSCreenW/2, 50)];
        self.companyLab.font = [UIFont systemFontOfSize:16];
        self.companyLab.textColor = grayLineColor;

        
        
        self.addressLab = [[UILabel alloc] initWithFrame:CGRectMake(30, 40, KSCreenW/4*3, 20)];
        self.addressLab.font = [UIFont systemFontOfSize:13];
        self.addressLab.textColor = grayLineColor;
        
//        self.adressLab = [[UILabel alloc] initWithFrame:CGRectMake(30, 40, KSCreenW/4*3, 20)];
//        self.adressLab.font = [UIFont systemFontOfSize:13];
//        self.adressLab.textColor = grayFontColor;
//        
//        UIImageView *excIntegralImage = [[UIImageView alloc] initWithFrame:CGRectMake(140.0f, 100.0f, 15.0f, 15.0f)];
//        excIntegralImage.image = [UIImage imageNamed:@"int_Jifen"];
//        self.excIntegralLab = [[UILabel alloc] initWithFrame:CGRectMake(160.0f, 98.0f, 100.0f, 20.0f)];
//        self.excIntegralLab.font = [UIFont systemFontOfSize:13];
//        self.excIntegralLab.textColor = blueFontColor;
        
//        UIImageView *exchangedlImage = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth-80.0f, 60.0f, 60.0f, 25.0f)];
//        exchangedlImage.image = [UIImage imageNamed:@"int_Duihuan"];
//        
//        UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 139, kScreenWidth, 1)];
//        lineLab.layer.borderWidth = 1;
//        lineLab.layer.borderColor = [cellGrayColor CGColor];
//        
//        [self.contentView addSubview:self.excImageView];
//        [self.contentView addSubview:self.excNameLab];
//        [self.contentView addSubview:self.excCodeLab];
//        [self.contentView addSubview:self.excValidityLab];
//        [self.contentView addSubview:excIntegralImage];
//        [self.contentView addSubview:self.excIntegralLab];
//        [self.contentView addSubview:exchangedlImage];
//        [self.contentView addSubview:lineLab];
        
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
