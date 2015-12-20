//
//  FirstViewController.m
//  Demo-1126-BuDing
//
//  Created by hb on 15/11/26.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "FirstViewController.h"

#import "UIViewController+MMDrawerController.h"
#import "AFNetworking/AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "YYModel.h"

#import "ConfigModel.h"
#import "CategoryModel.h"
#import "ImageModel.h"

#import "CoustomTitleView.h"
#import "CustomScrollView.h"
#import "CustomUIView.h"
#import "CustomUIView_Later.h"
#import "FirstScrollView.h"

#import "NetWorkingManager.h"
#import "DataSourceManager.h"
#import "ErrorInfo.h"
#import "APls.h"

@interface FirstViewController()<UIScrollViewDelegate,UIGestureRecognizerDelegate,NetworkManagerDelegate,DataSourceManagerDelegate>
{

    UIScrollView *_scrollView;
    CGSize _size;
   
    NSInteger _currentIndex;
    CoustomTitleView *_customTitleView;
//    
    CustomUIView *_currentView;
    CustomUIView_Later *_laterView;
    
    DataSourceManager *dataManager;
   
   
}

@end

@implementation FirstViewController
-(void)viewDidLoad{

    [super viewDidLoad];
   
    
    _size = self.view.frame.size;
    self.view.backgroundColor = [UIColor redColor];
    
    [self configNavicationBar];
    
    _customTitleView = [[CoustomTitleView alloc]initWithFrame:CGRectMake(0, 0, 120, 43)];
    self.navigationItem.titleView = _customTitleView;
    
    [_customTitleView firstVcCustomButtonClicked:^(UIButton *button, NSInteger index) {
       
        if (index == 1) {
            
            [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
        else if (index == 2){
            
            [_scrollView setContentOffset:CGPointMake(_size.width, 0) animated:YES];
        
        }
       
    }];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(2*_size.width, _size.height);
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    [self.view addSubview:_scrollView];
    [_scrollView.panGestureRecognizer addTarget:self action:@selector(openTheDrawerPan)];
    
    _currentView = [[CustomUIView alloc]initWithFrame:CGRectMake(0, 0, _size.width, _size.height)];
    _currentView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_currentView];
    
    _laterView = [[CustomUIView_Later alloc]initWithFrame:CGRectMake(_size.width, 0, _size.width, _size.height)];
    _laterView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_laterView];
    
    
    
    dataManager = [[DataSourceManager alloc]init];
    dataManager.delegate = self;
  
    //跑马灯网络请求
    NetWorkingManager *manager = [NetWorkingManager new];
    manager.delegate = dataManager;
    [manager networkManagerWithUrl:[NSString stringWithFormat:@"%@%@",KhomePath,KConfig] andPara:nil];
    //分类图片请求
    NetWorkingManager *manager2 = [NetWorkingManager new];
    manager2.delegate = dataManager;
    [manager2 networkManagerWithUrl:[NSString stringWithFormat:@"%@%@",KhomePath,KCategory] andPara:nil];


    self.mm_drawerController.panGestureRecognizer.delegate = self;
    
    
}

-(void)sendTheData:(NSArray *)dataSource andManager:(NetWorkingManager *)manager andError:(ErrorInfo *)error{
    
    if (error) {
        
        ErrorInfo *error1 = error;
        NSString *errorInfo = error1.errorDes;
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"⚠️" message:[NSString stringWithFormat:@"%@",errorInfo] preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertController addAction:action];
        [self presentViewController:alertController animated:YES completion:^{
            
        }];
        
        NSLog(@"%@",errorInfo);
        return;
        
    }
    
    if ([manager.url isEqual:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",KhomePath,KCategory]]]) {
        
        
        _currentView.dataList = [dataSource copy];
        _laterView.dataList = [dataSource copy];
        
        [_currentView.collectionView reloadData];
        [_laterView.collectionView reloadData];
            
        
        
    }
    
    else if ([manager.url isEqual:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",KhomePath,KConfig]]]){
        
        
        _currentView.urls = [dataSource copy];        
        [_currentView.customScrollView reloadInputViews];
    
    }
    
}

-(void)configNavicationBar{


    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"icon" style:UIBarButtonItemStylePlain target:self action:@selector(hearderIconClicked)];
    self.automaticallyAdjustsScrollViewInsets = NO;


}

-(void)openTheDrawerPan{

    self.mm_drawerController.panGestureRecognizer.enabled = YES;

}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{

    return YES;

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    [self configScrlloView:_scrollView];
     _customTitleView.index = _currentIndex;
    
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

    [self configScrlloView:_scrollView];

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{


    if (_currentIndex == 2 && self.mm_drawerController.panGestureRecognizer.enabled == YES) {
        
        self.mm_drawerController.panGestureRecognizer.enabled = NO;
    }


}

-(void)configScrlloView:(UIScrollView *)scrollView{
    

    CGFloat offset = scrollView.contentOffset.x;
    
    if (offset == _size.width) {
    
        _currentIndex = 2;
        
        self.mm_drawerController.panGestureRecognizer.enabled = NO;
        scrollView.bounces = YES;
        
    }
    else if (offset == 0){
        
        _currentIndex = 1;
        
        self.mm_drawerController.panGestureRecognizer.enabled = YES;
        scrollView.bounces = NO;
        
    }

}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (_currentIndex == 2) {
        
        self.mm_drawerController.panGestureRecognizer.enabled = NO;
        
    }
}



-(void)hearderIconClicked{
    
    //左边VC打开的时候
    if (self.mm_drawerController.openSide == MMDrawerSideLeft) {
        //关闭
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        
    }
    else{
        //左边VC关闭时，打开
        [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:^(BOOL finished) {
        }];
    
    }
    
}


@end
