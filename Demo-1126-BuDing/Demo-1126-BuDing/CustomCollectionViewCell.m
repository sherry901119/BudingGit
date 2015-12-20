//
//  CustomCollectionViewCell.m
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/6.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "AFNetworking/AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "Masonry.h"

@interface CustomCollectionViewCell ()

{
    //UIImageView *_imageView;
    UILabel *_lable;

}

@end

@implementation CustomCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _imageView = [UIImageView new];
        _imageView.layer.cornerRadius = 5;
        _imageView.layer.masksToBounds = YES;
        [self.contentView addSubview:_imageView];
        
        _lable = [UILabel new];
        _lable.textAlignment = NSTextAlignmentCenter;
        _lable.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_lable];

        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.equalTo(self);
            make.bottom.equalTo(_lable.mas_top);
        }];
        
        
        [_lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_imageView.mas_bottom);
            make.left.and.right.equalTo(self);
            make.height.equalTo(@20);
            make.bottom.equalTo(self.mas_bottom);
            
        }];
        
    }

    return self;
}

-(void)setTitle:(NSString *)title{

    _lable.text = title;

}

-(void)setImageView:(UIImageView *)imageView{

    _imageView = imageView;

}

-(void)setTitleImage:(NSString *)titleImage{

    [_imageView setImageWithURL:[NSURL URLWithString:titleImage]];
   // _imageView.image = titleImage;


}
@end
