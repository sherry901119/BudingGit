//
//  ImageModel.h
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/8.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject<NSCopying>
@property(nonatomic,assign)float width;
@property(nonatomic,assign)float height;
@property(nonatomic,copy)NSString *url;
@end
