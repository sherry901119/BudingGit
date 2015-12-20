//
//  FirstScrollView.m
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/8.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "FirstScrollView.h"
#import "CustomUIView.h"
#import "CustomUIView_Later.h"
#import "CustomScrollView.h"

#import "UIViewController+MMDrawerController.h"
#import "AFNetworking/AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "YYModel.h"

#import "NetWorkingManager.h"
#import "DataSourceManager.h"
#import "APls.h"
#import "ConfigModel.h"
#import "CategoryModel.h"
#import "ImageModel.h"

@interface FirstScrollView ()<UIScrollViewDelegate,UIGestureRecognizerDelegate,NetworkManagerDelegate,DataSourceManagerDelegate>
{

    CGSize _size;
    CustomUIView *_currentView;
    CustomUIView_Later *_laterView;
    
}

@end

@implementation FirstScrollView

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        _size = frame.size;
        
        _currentView = [[CustomUIView alloc]initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
        _currentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_currentView];
        
        _laterView = [[CustomUIView_Later alloc]initWithFrame:CGRectMake(_size.width, 0, _size.width, _size.height)];
        _laterView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_laterView];
        
        DataSourceManager *dataManager = [[DataSourceManager alloc]init];
        dataManager.delegate = self;
        
    
    }
    
    return self;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
