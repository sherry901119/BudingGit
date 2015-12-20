//
//  CustomView.m
//  Demo-1126-BuDing
//
//  Created by hb on 15/11/27.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
 
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(5, 5, rect.size.width-10, rect.size.height-10)];
    //颜色有点透明
    [[UIColor colorWithWhite:1 alpha:0.5]setStroke];
    path.lineWidth = 4;
    
    [path stroke];

}
@end
