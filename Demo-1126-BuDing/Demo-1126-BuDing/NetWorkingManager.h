//
//  NetWorkingManager.h
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/8.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ErrorInfo;
@class NetWorkingManager;
@protocol NetworkManagerDelegate <NSObject>

@optional
-(void)theResponseResultWith:(NetWorkingManager *)manager andResponse:(id)response and:(ErrorInfo *)error;

@end

@interface NetWorkingManager : NSObject
@property(nonatomic,strong,readonly)NSURL *url;
@property(nonatomic,weak)id<NetworkManagerDelegate>delegate;

-(void)networkManagerWithUrl:(NSString *)urlString andPara:(NSDictionary *)para;
@end
