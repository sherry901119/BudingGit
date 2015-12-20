//
//  ConfigModel.m
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/8.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "ConfigModel.h"

@implementation ConfigModel

-(id)copyWithZone:(NSZone *)zone{

    ConfigModel *model = [[ConfigModel allocWithZone:zone]init];
    model->_imageUrl = _imageUrl;
    return model;
}

@end
