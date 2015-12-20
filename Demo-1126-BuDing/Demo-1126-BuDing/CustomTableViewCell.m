//
//  CustomTableViewCell.m
//  Demo-1126-BuDing
//
//  Created by hb on 15/11/26.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "Masonry.h"

@interface CustomTableViewCell ()
{

    UILabel *_lable;
    UIImageView *_lImageView;


}

@end

@implementation CustomTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{


    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _lImageView = [UIImageView new];
        [self.contentView addSubview:_lImageView];
        
        _lable = [UILabel new];
        _lable.font = [UIFont systemFontOfSize:18];
        _lable.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_lable];
        
        
    }
    
    return self;

}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    [_lImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(3);
        make.left.equalTo(self.mas_left).offset(10);
        make.width.equalTo(@50);
        make.height.equalTo(@50);
    }];
    
    [_lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(_lImageView.mas_right).offset(20);
        make.width.equalTo(@150);
        make.height.equalTo(@50);
        
    }];


}

-(void)setTitle:(NSString *)title{

    _lable.text = title;

}

-(void)setHeadImage:(UIImage *)headImage{

    _lImageView.image = headImage;


}




@end
