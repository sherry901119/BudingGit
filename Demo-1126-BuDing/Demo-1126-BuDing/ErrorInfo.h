//
//  ErrorInfo.h
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/9.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorInfo : NSObject

@property (nonatomic,copy,readonly)NSString *errorDes;

- (instancetype)initWithError:(NSError *)error;
@end
