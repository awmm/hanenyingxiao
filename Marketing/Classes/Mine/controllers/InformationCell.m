//
//  InformationCell.m
//  Marketing
//
//  Created by HanenDev on 16/2/25.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//

#import "InformationCell.h"
#define STARTX 20.0f
#define CELLHEIGHT 80.0f

@implementation InformationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGFloat cellY = 5;
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(STARTX, cellY, KSCreenW -2*STARTX, 30)];
        _titleLabel.textColor = lightGrayFontColor;
        _titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [self.contentView addSubview:_titleLabel];
        
        _subLabel = [[UILabel alloc]initWithFrame:CGRectMake(STARTX, _titleLabel.maxY, KSCreenW -2*STARTX, 40)];
        _subLabel.textColor = lightGrayFontColor;
        _subLabel.font = [UIFont systemFontOfSize:18.0f];
        [self.contentView addSubview:_subLabel];
        
        _qrImage = [[UIImageView alloc]initWithFrame:CGRectMake(KSCreenW - STARTX -40-10, 20, 40, 40)];
        //_qrImage.layer.cornerRadius = 20;
        //_qrImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_qrImage];
        
        UIView *lineView =[[UIView alloc]initWithFrame:CGRectMake(STARTX, CELLHEIGHT - 1, KSCreenW -2*STARTX, 1)];
        lineView.backgroundColor = grayLineColor;
        [self.contentView addSubview:lineView];
               
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
