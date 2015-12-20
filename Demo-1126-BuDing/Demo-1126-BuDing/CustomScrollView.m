//
//  CustomScrollView.m
//  Demo-1202-scrlloview
//
//  Created by hb on 15/12/2.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "CustomScrollView.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "UIViewController+MMDrawerController.h"
#import "Masonry.h"
#import "FirstViewController.h"
#import "ConfigModel.h"


@interface CustomScrollView ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>
{

    CGSize _size;
    CGRect _frame;

    UIImageView *_beforeImageView;
    UIImageView *_currentImageView;
    UIImageView *_laterImageView;
    
    NSMutableArray *_imageUrlViews;
    
    UIPageControl *_pageControl;
    
}

@end

@implementation CustomScrollView
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
        _frame = frame;
        _size = frame.size;
        
        self.backgroundColor = [UIColor whiteColor];
        self.contentSize = CGSizeMake(3 * _size.width,_size.height);
        self.delegate = self;
        self.pagingEnabled = YES;
        self.bounces = NO;
        
        _beforeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_beforeImageView];
        
        _currentImageView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width, 0, frame.size.width, frame.size.height)];
        [self addSubview:_currentImageView];
        
        _laterImageView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width*2, 0, frame.size.width, frame.size.height)];
        [self addSubview:_laterImageView];
        
        _beforeImageView.backgroundColor = [UIColor grayColor];
        _currentImageView.backgroundColor = [UIColor greenColor];
        _laterImageView.backgroundColor = [UIColor redColor];
        
        
        [self setContentOffset:CGPointMake(_size.width, 0) animated:NO];
        
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoMove) userInfo:nil repeats:YES];
        
//        UITapGestureRecognizer *tap = [UITapGestureRecognizer new];
//        [self addGestureRecognizer:tap];
//        [tap addTarget:self action:@selector(closeTheDrawerPan)];
        
        [self.panGestureRecognizer addTarget:self action:@selector(closeTheDrawerPan)];
        
    }


    return self;

}

-(void)closeTheDrawerPan{
    
    FirstViewController *vC = (FirstViewController *)[self findViewControllerWithScrollView:self];
    
    vC.mm_drawerController.panGestureRecognizer.enabled = NO;

}

-(void)didMoveToSuperview{


    _pageControl = [UIPageControl new];
    
    _pageControl.pageIndicatorTintColor = [UIColor blackColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [self.superview addSubview:_pageControl];
    
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.equalTo(@30);
        make.width.equalTo(@200);
        make.bottom.equalTo(self.mas_bottom);
    }];

}

-(void)autoMove{
    
    [self setContentOffset:CGPointMake(_size.width*2, 0) animated:YES];
    
}


-(void)setImageUrls:(NSArray *)imageUrls{
    
    _imageUrls = imageUrls;
    
    _pageControl.numberOfPages = _imageUrls.count;
    
    _imageUrlViews = [NSMutableArray array];
    
    for (int i = 0; i < imageUrls.count; i++) {
        
        UIImageView *tempImageViews = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _size.width,_size.height)];
        ConfigModel *model = imageUrls[i];
        
        [tempImageViews setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"86.jpg"]];
        
        [_imageUrlViews addObject:tempImageViews];
        
    }
    //少于2的数组，不能翻动scrollview
    if(imageUrls.count < 2){
        
        self.scrollEnabled = NO;
        UIImageView *imageView = _imageUrlViews.firstObject;
        _currentImageView.image = imageView.image;
        
        return;
    }
    UIImageView *tempImageView = _imageUrlViews[imageUrls.count - 1];
    _beforeImageView.image = tempImageView.image;
   
    UIImageView *tempImageView2 = _imageUrlViews[0];
    _currentImageView.image = tempImageView2.image;
    
    UIImageView *tempImageView3 = _imageUrlViews[1];
    _laterImageView.image = tempImageView3.image;
  

}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

     [self setScrollView:scrollView];

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
     [self setScrollView:scrollView];

}

-(void)setScrollView:(UIScrollView *)scrollView{

    static NSInteger currentIndex = 0;
    NSInteger beforeIndex = 0,laterIndex = 0;
    
    if(scrollView.contentOffset.x == 2 *_size.width){//到右
        
        currentIndex++;
        if(currentIndex >= [self.imageUrls count]){
            
            currentIndex = 0;
        }
    }
    
    if(scrollView.contentOffset.x == 0){//到左
        
        currentIndex--;
        if(currentIndex < 0){
            
            currentIndex = [self.imageUrls count] - 1;
        }
    }
    
    if(currentIndex == 0){
        
        beforeIndex = [self.imageUrls count] - 1;
        laterIndex = currentIndex + 1;
        
    }else if (currentIndex == ([self.imageUrls count] -1)){
        
        beforeIndex = currentIndex - 1;
        laterIndex = 0;
        
    }else{
        
        beforeIndex = currentIndex - 1;
        laterIndex = currentIndex + 1;
        
    }
    
    UIImageView *imageView = _imageUrlViews[beforeIndex];
    _beforeImageView.image = imageView.image;
    
    UIImageView *imageView2 = _imageUrlViews[currentIndex];
    _currentImageView.image = imageView2.image;
    
    UIImageView *imageView3 = _imageUrlViews[laterIndex];
    _laterImageView.image = imageView3.image;
    
    [scrollView setContentOffset:CGPointMake(_size.width, 0) animated:NO];
    
    _pageControl.currentPage = currentIndex;
    
 

}

//找到vc
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


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
    
   // UIScrollView *tempScrollView = (UIScrollView*)self.superview.superview;
    //tempScrollView.scrollEnabled = NO;
    
    
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
}




#if 0
-(void)setImages:(NSArray *)images{
    
    if(images.count < 2){
        
        self.scrollEnabled = NO;
        _currentView.image = [images firstObject];
        return;
    }
    
    _images = images;
    
    _beforeView.image = self.images[self.images.count - 1];
    _currentView.image = self.images[0];
    _laterView.image = self.images[1];
    
}
#endif



@end
