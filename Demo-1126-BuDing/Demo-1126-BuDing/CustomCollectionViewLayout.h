//
//  CustomCollectionViewLayout.h
//  Demo-1204-CollectionView
//
//  Created by xiaohuifang on 15/12/7.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomLayoutDelegate <NSObject>

@required
-(CGFloat)CollectionCellHeightWithIndexPath:(NSIndexPath *)indexPath;

@end

@interface CustomCollectionViewLayout : UICollectionViewLayout
@property(nonatomic,weak)id<CustomLayoutDelegate> delegate;
@property(nonatomic,assign)CGFloat itemWidth;
@property(nonatomic,assign)CGFloat itemSpace;
@property(nonatomic,assign)CGFloat minItemSpace;

@end
