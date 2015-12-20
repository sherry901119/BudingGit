//
//  ImageModel.m
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/8.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel

-(id)copyWithZone:(NSZone *)zone{

    ImageModel *model = [[ImageModel allocWithZone:zone]init];
    model->_height = _height;
    model->_width = _width;
    model->_url = _url;
    return model;
}

@end
