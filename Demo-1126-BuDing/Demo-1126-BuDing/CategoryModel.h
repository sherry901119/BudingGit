//
//  CategoryModel.h
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/7.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageModel.h"

@interface CategoryModel : NSObject<NSCopying>
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)ImageModel *image;

//@property(nonatomic,copy)NSString *width;
//@property(nonatomic,copy)NSString *height;
//@property(nonatomic,copy)NSString *url;
//
//
//-(instancetype)initWithDic:(NSDictionary *)dic;
@end
