//
//  CustomHeaderView.h
//  Demo-1126-BuDing
//
//  Created by hb on 15/11/27.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomHeaderView : UIView
@property(nonatomic,strong)UIImage *lHeaderImage;
@property(nonatomic,copy)NSString *headerTitle;
@property(nonatomic,copy)NSString *followCount;
@property(nonatomic,copy)NSString *fansCount;
@property(nonatomic,assign)BOOL isLogin;

-(void)headButtonClicked:(void(^)(UIButton * button,NSInteger index))block;

@end
