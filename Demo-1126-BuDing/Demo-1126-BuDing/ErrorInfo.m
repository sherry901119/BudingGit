//
//  ErrorInfo.m
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/9.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "ErrorInfo.h"

@implementation ErrorInfo

- (instancetype)initWithError:(NSError *)error{

    self = [super init];
    if (self) {
        
        if (error.code >= 400) {
            
            _errorDes = @"请求失败";
        }
    }
    
    return self;
}
@end
