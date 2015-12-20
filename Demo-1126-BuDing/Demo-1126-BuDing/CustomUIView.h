//
//  CustomUIView.h
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/4.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomScrollView;

@interface CustomUIView : UIView
@property(nonatomic,copy)NSArray *urls;
@property(nonatomic,copy)NSArray *dataList;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)CustomScrollView *customScrollView;


@end
