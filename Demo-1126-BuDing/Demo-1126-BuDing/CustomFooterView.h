//
//  CustomFooterView.h
//  Demo-1126-BuDing
//
//  Created by hb on 15/11/26.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomFooterView : UIView
@property(nonatomic,strong)UIImageView *imageView1;
@property(nonatomic,strong)UIImageView *imageView2;
@property(nonatomic,copy)NSString *buttonTitle1;
@property(nonatomic,copy)NSString *buttonTitle2;

-(void)buttonClickedBlock:(void(^)(UIButton *sender,NSInteger index))blc;
@end

