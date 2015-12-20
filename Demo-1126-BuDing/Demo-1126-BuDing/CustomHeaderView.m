//
//  CustomHeaderView.m
//  Demo-1126-BuDing
//
//  Created by hb on 15/11/27.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "CustomHeaderView.h"
#import "Masonry.h"
#import "CustomView.h"

@interface CustomHeaderView ()

{
    CustomView *_customView;
    UIButton *_buttonView;
    UILabel *_headerLable;
    UIButton *_followButton;
    UIButton *_fansButton;
    void(^tempBlock)(UIButton *,NSInteger);


}

@end

@implementation CustomHeaderView
-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        _customView = [CustomView new];
        [self addSubview:_customView];
        _customView.backgroundColor = [UIColor clearColor];
        
        
        _buttonView = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonView.backgroundColor = [UIColor yellowColor];
        _buttonView.layer.cornerRadius = 30;
        _buttonView.tag = 2001;
        [_buttonView setImage:[UIImage imageNamed:@"defaultHeader.jpg"] forState:UIControlStateNormal];
        //图像匹配
        _buttonView.layer.masksToBounds = YES;
        [_buttonView addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_buttonView];
        
        
        _headerLable = [UILabel new];
        _headerLable.text = @"登录同步追番记录";
        _headerLable.font = [UIFont systemFontOfSize:20];
        _headerLable.textColor = [UIColor whiteColor];
        _headerLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_headerLable];
       
        
        _followButton = [self buttonWithCharacter];
        _followButton.hidden = YES;
        _followButton.tag = 2002;
        [_followButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_followButton];
        
        
        _fansButton = [self buttonWithCharacter];
        _fansButton.hidden = YES;
        _fansButton.tag = 2003;
        [_fansButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_fansButton];
        
    }
    return  self;
}
//设置button
- (UIButton *)buttonWithCharacter{
    
    UIButton *button_set = [UIButton buttonWithType:UIButtonTypeCustom];
    button_set.titleLabel.font = [UIFont systemFontOfSize:18];
    [button_set setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_set setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    return button_set;
}


-(void)layoutSubviews{

    [super layoutSubviews];
    
    [_customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).offset(40);
        make.width.and.height.equalTo(@80);
    }];
    
    [_buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_customView);
        make.width.and.height.equalTo(@60);
    }];
    
    [_headerLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_buttonView.mas_bottom).offset(10);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
        make.height.equalTo(@50);
    }];
    
    [_followButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerLable.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(40);
        make.width.equalTo(@60);
        make.height.equalTo(@50);
    }];

    
    [_fansButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headerLable.mas_bottom).offset(0);
        make.right.equalTo(self.mas_right).offset(-40);
        make.width.equalTo(@60);
        make.height.equalTo(@50);
    }];

}

-(void)setLHeaderImage:(UIImage *)lHeaderImage{

   [_buttonView setImage:lHeaderImage forState:UIControlStateNormal];

}

-(void)setHeaderTitle:(NSString *)headerTitle{

    _headerLable.text = headerTitle;
}

-(void)setFollowCount:(NSString *)followCount{

    NSString *count = [NSString stringWithFormat:@"关注%@",followCount];
    [_followButton setTitle:count forState:UIControlStateNormal];

}

-(void)setFansCount:(NSString *)fansCount{

    NSString *count = [NSString stringWithFormat:@"粉丝%@",fansCount];
    [_fansButton setTitle:count forState:UIControlStateNormal];
}

-(void)setIsLogin:(BOOL)isLogin{

    _followButton.hidden = !isLogin;
    _fansButton.hidden = !isLogin;

}

-(void)buttonClicked:(UIButton *)sender{

    if (tempBlock) {
        tempBlock(sender,sender.tag-2000);
    }

}

-(void)headButtonClicked:(void (^)(UIButton *, NSInteger))block{

    tempBlock = ^(UIButton *button,NSInteger index){
    
        block(button,index);
    
    };

}
@end
