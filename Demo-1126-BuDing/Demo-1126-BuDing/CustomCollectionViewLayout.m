//
//  CustomCollectionViewLayout.m
//  Demo-1204-CollectionView
//
//  Created by xiaohuifang on 15/12/7.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "CustomCollectionViewLayout.h"

@interface CustomCollectionViewLayout ()
{

    NSMutableArray *_recodeY;
    NSMutableArray *_attrs;
    NSInteger _columns;

}

@end

@implementation CustomCollectionViewLayout
-(instancetype)init{

    self = [super init];
    if (self) {
        
        _recodeY = [NSMutableArray array];
        _attrs = [NSMutableArray array];
    }
    return self;
}

-(void)prepareLayout{
    [super prepareLayout];
    
    //列数
    _columns = (self.collectionView.frame.size.width - _itemSpace)/(_itemWidth + _itemSpace);
    _columns = (NSInteger)floorf(_columns);//取整
    
    //间距平均
    _itemSpace = (self.collectionView.frame.size.width - _columns * _itemWidth)/(_columns + 1);

    if (_itemSpace < _minItemSpace) {
        _itemSpace = _minItemSpace;
    }
    
    //每个列都用一个数组保存y值
    for (int temp = 0; temp < _columns; temp++) {
        
        NSMutableArray *tempRecodeY = [NSMutableArray array];
        
        if(_recodeY.count < _columns){
        
            [_recodeY addObject:tempRecodeY];
        }
        
        
    }
    //段数
    NSInteger sections = [self.collectionView numberOfSections];
    
    for (int i = 0; i < sections; i++) {
        //item总数
        NSInteger totalItems = [self.collectionView numberOfItemsInSection:i];
        
        for (int j = 0; j < totalItems; j++) {
            
        //在第几列
            NSInteger currentIndex = j % _columns;
            //拿到同一列上一行的item的y
            NSMutableArray *tempRecodeY = _recodeY[currentIndex];
            NSNumber *numY = tempRecodeY.lastObject;
            
            //x y 坐标
            CGFloat position_x = _itemWidth*currentIndex + (currentIndex + 1)*_itemSpace;
            CGFloat position_y = numY.floatValue + _itemSpace;

            //item的长度由外界输入
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            CGFloat itemHeight = [self.delegate CollectionCellHeightWithIndexPath:indexPath];
            //保存y，注意y不同于item的y坐标，因为y=y坐标+height
            [tempRecodeY addObject:@(position_y + itemHeight)];
            
            UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            
            attr.frame = CGRectMake(position_x, position_y, _itemWidth, itemHeight);
            
            [_attrs addObject:attr];
        }
        
    }

}

-(void)setItemSpace:(CGFloat)itemSpace{

    _itemSpace = itemSpace;

}

-(void)setMinItemSpace:(CGFloat)minItemSpace{

    _minItemSpace = minItemSpace;

}

-(void)setItemWidth:(CGFloat)itemWidth{

    _itemWidth = itemWidth;

}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{

    return _attrs;

}

-(CGSize)collectionViewContentSize{
    
    
    if (![_attrs count]) {
    
        return CGSizeZero;
    }
    
    NSMutableArray *recodeY = [NSMutableArray array];
    //拿到每列的最后一个y，用来比较大小
    for (int i = 0; i < _recodeY.count; i++) {
        
        NSMutableArray *tempArray = _recodeY[i];
        [recodeY addObject:tempArray.lastObject];
        
    }
    NSNumber *ny = recodeY.firstObject;
    CGFloat maxHeight = ny.floatValue;
    
    //最大的最为collectionview的height
    for (NSNumber *numY in recodeY) {
        
        if (maxHeight < numY.floatValue ) {
            maxHeight = numY.floatValue;
        }
        
    }
    
    return CGSizeMake(self.collectionView.frame.size.width,maxHeight);

}
@end
