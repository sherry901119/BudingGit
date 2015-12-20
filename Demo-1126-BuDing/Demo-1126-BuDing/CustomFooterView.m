//
//  CustomFooterView.m
//  Demo-1126-BuDing
//
//  Created by hb on 15/11/26.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "CustomFooterView.h"
#import "Masonry.h"

@interface CustomFooterView ()
{
    UIButton *_button;
    UIButton *_button2;
    void(^tempBlock)(UIButton *,NSInteger);

}

@end

@implementation CustomFooterView
-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {

        _imageView1 = [UIImageView new];
        _imageView1.image = [UIImage imageNamed:@"setIcon"];
        [self addSubview:_imageView1];
        
        _button = [self buttonWithTitle:@"设置"];
       
        _button.tag = 1001;
        [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
        
        _imageView2 = [UIImageView new];
        _imageView2.image = [UIImage imageNamed:@"notiIcon"];
        [self addSubview:_imageView2];
        
        _button2 = [self buttonWithTitle:@"通知"];
        _button2.tag = 1002;
        [self addSubview:_button2];
        [_button2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
           }

    return self;

}
- (UIButton *)buttonWithTitle:(NSString *)title{
    
    UIButton *button_set = [UIButton buttonWithType:UIButtonTypeCustom];
    button_set.titleLabel.font = [UIFont systemFontOfSize:18];
    //button内文字对齐方式
    button_set.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button_set setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_set setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [button_set setTitle:title forState:UIControlStateNormal];
    
    return button_set;
}

-(void)layoutSubviews{

    [super layoutSubviews];
   
    
    [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.left.equalTo(self.mas_left).offset(15);
        make.width.and.height.equalTo(@30);
    }];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_imageView1);
        make.left.equalTo(_imageView1.mas_right).offset(15);
        make.height.equalTo(_imageView1);
        make.width.equalTo(@70);
        
    }];
   
    
    [_button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_imageView1);
        make.right.equalTo(self.mas_right).offset(-15);
         make.height.equalTo(_imageView1);
        make.width.equalTo(@70);
    }];
    
    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_imageView1);
        make.width.and.height.equalTo(_imageView1);
        make.right.equalTo(_button2.mas_left).offset(-15);
    }];

}

-(void)buttonClicked:(UIButton *)sender{

    if (tempBlock) {
        tempBlock(sender,sender.tag-1000);
    }
}

-(void)buttonClickedBlock:(void (^)(UIButton *,NSInteger))blc{

    tempBlock = ^(UIButton *sender,NSInteger index){
    
        blc(sender,index);
    
    };
}

-(void)setButtonTitle1:(NSString *)buttonTitle1{

    _buttonTitle1 = buttonTitle1;
   [_button setTitle:buttonTitle1 forState:UIControlStateNormal];
    
}

-(void)setButtonTitle2:(NSString *)buttonTitle2{

    _buttonTitle2 = buttonTitle2;
    [_button2 setTitle:buttonTitle2 forState:UIControlStateNormal];
    
}
@end
