//
//  FirstVC_CoustomView.h
//  Demo-1126-BuDing
//
//  Created by hb on 15/11/27.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoustomTitleView : UIView
@property(nonatomic,copy)NSString *title1;
@property(nonatomic,copy)NSString *title2;


@property(nonatomic,assign)NSInteger index;

-(void)firstVcCustomButtonClicked:(void(^)(UIButton *button,NSInteger index))block;

@end
