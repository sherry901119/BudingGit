//
//  CustomUIView_Later.m
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/6.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "CustomUIView_Later.h"
#import "UIViewController+MMDrawerController.h"
#import "CustomCollectionViewCell.h"
#import "CustomCollectionViewLayout.h"
#import "CategoryModel.h"

#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "Masonry.h"
#import "YYModel.h"

@interface CustomUIView_Later ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CustomLayoutDelegate>
{

    //UICollectionView *_collectionView;
    CGSize _size;
    CustomCollectionViewLayout *_customLayout;
}

@end

@implementation CustomUIView_Later

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        _customLayout = [CustomCollectionViewLayout new];
        _customLayout.delegate = self;
        _customLayout.itemWidth = 190;
        _customLayout.itemSpace = 10;
        
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:_customLayout];
        [_collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(76);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.mas_bottom);
            
        }];
    }
    return self;

}

-(void)setDataList:(NSArray *)dataList{

    _dataList = dataList;
    

}

-(CGFloat)CollectionCellHeightWithIndexPath:(NSIndexPath *)indexPath{
    
    
    CategoryModel *model = _dataList[indexPath.row];
    float height = model.image.height;
    float width = model.image.width;
    
    CGFloat cellheight =height * 190/width;
    return cellheight;

}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
  
    
    CategoryModel *model = _dataList[indexPath.row]; 

    
    cell.title = model.name;

    
    [cell.imageView setImageWithURL:[NSURL URLWithString:model.image.url] placeholderImage:[UIImage imageNamed:@"86.jpg"]];
    

    return cell;
    
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _dataList.count;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"uiview2。。。touchbegin");
    
    UITouch *touch = [touches anyObject];
    
    UIView *view = touch.view;
    
    UIScrollView *scrollView = (UIScrollView *)view.superview;
    scrollView.scrollEnabled = YES;
    
}

-(UIViewController *)findViewControllerWithScrollView:(UIResponder *)responder{
    
    UIResponder *tempResponder = responder;
    
    if ([tempResponder isKindOfClass:[UIViewController class]]) {
        return (UIViewController *)tempResponder;
    }
    else{
        
        tempResponder = tempResponder.nextResponder;
        return [self findViewControllerWithScrollView:tempResponder];
    }
    
    
    return nil;
}

@end
