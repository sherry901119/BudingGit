//
//  CoustomTitleView.m
//  Demo-1126-BuDing
//
//  Created by hb on 15/11/27.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "CoustomTitleView.h"
#import "Masonry.h"

@interface CoustomTitleView ()
{
    
    UIButton *_tempButton;
    UIView *_lineView;
    
    void(^tempBlock)(UIButton *,NSInteger);

}

@end

@implementation CoustomTitleView
-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        UIButton *titleViewButton1 = [self buttonWithTitle:@"推荐" andTag:3001];
        _tempButton = titleViewButton1;
        titleViewButton1.selected = YES;
        [self addSubview:titleViewButton1];
        
        
        _lineView = [UIView new];
        [self addSubview:_lineView];
        _lineView.backgroundColor = [UIColor redColor];
        
        
        UIButton *titleViewButton2 = [self buttonWithTitle:@"分类" andTag:3002];
        [self addSubview:titleViewButton2];
        
        
        [titleViewButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
            make.width.equalTo(self.mas_width).multipliedBy(0.5);
            make.bottom.equalTo(self.mas_bottom).offset(-3);
            
        }];
        
        [titleViewButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleViewButton1);
            make.right.equalTo(self.mas_right);
            make.width.equalTo(self.mas_width).multipliedBy(0.5);
            make.bottom.equalTo(titleViewButton1);
        }];
        
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleViewButton1.mas_bottom);
            make.left.equalTo(self.mas_left);
            make.width.equalTo(self.mas_width).multipliedBy(0.5);
            make.bottom.equalTo(self.mas_bottom);
    
        }];
        

    }
    
    return self;
}
//创建，设置button

- (UIButton *)buttonWithTitle:(NSString *)title andTag:(NSInteger)tag1{
    
    UIButton *button_set = [UIButton buttonWithType:UIButtonTypeCustom];
    [button_set setTitle:title forState:UIControlStateNormal];
    button_set.titleLabel.font = [UIFont systemFontOfSize:18];
    button_set.tag = tag1;
    //button内文字对齐方式
    button_set.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [button_set setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button_set setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button_set addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return button_set;
}


-(void)buttonClicked:(UIButton *)sender{
    
    _tempButton.selected = NO;
    sender.selected = YES;
    _tempButton = sender;
    
    NSInteger flag = sender.tag;
    
    if (flag == 3001) {
          
        [self lineToLeft:sender];
        
    }
    else if (flag == 3002){
        
        [self lineToRight:sender];
       
    }

    if (tempBlock) {
        tempBlock(sender,sender.tag-3000);
    }
    
}

-(void)firstVcCustomButtonClicked:(void (^)(UIButton *, NSInteger))block{

    tempBlock = ^(UIButton *button,NSInteger index){
        
        block(button,index);
    
    };

}

-(void)lineToLeft:(UIButton *)sender{

    [_lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(sender.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.width.equalTo(self.mas_width).multipliedBy(0.5);
        make.bottom.equalTo(self.mas_bottom);
        
        
    }];
    
    [UIView animateWithDuration:0.2 animations:^{
        
        //花0.2秒去布局,就会有动画效果
        [self layoutIfNeeded];
    }];


}

-(void)lineToRight:(UIButton *)sender{

    [_lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(sender.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.width.equalTo(self.mas_width).multipliedBy(0.5);
        make.bottom.equalTo(self.mas_bottom);
        
    }];
    
    [UIView animateWithDuration:0.2 animations:^{
        
        //花0.2秒去布局,就会有动画效果
        [self layoutIfNeeded];
    }];

}

-(void)setIndex:(NSInteger)index{
    
    UIButton *button = (UIButton *)[self viewWithTag:(index+3000)];
    
    _tempButton.selected = NO;
    button.selected = YES;
    _tempButton = button;
    
    if (index == 1) {
        
        [self lineToLeft:button];
        
    }
    else if (index == 2){
        
        [self lineToRight:button];
        
    }
    
    if (tempBlock) {
        tempBlock(button,button.tag-3000);
    }
    
}

//外界也可以改变名字

//-(void)setTitle1:(NSString *)title{
//
//    [titleViewButton1 setTitle:title forState:UIControlStateNormal];
//
//}
//
//-(void)setTitle2:(NSString *)title2{
//
//    [titleViewButton2 setTitle:title2 forState:UIControlStateNormal];
//
//}



@end
