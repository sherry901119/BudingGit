//
//  DataSourceManager.h
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/9.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkingManager.h"
@class ErrorInfo;

@protocol DataSourceManagerDelegate <NSObject>

@optional
-(void)sendTheData:(NSArray *)dataSource andManager:(NetWorkingManager *)manager andError:(ErrorInfo *)error;

@end

@interface DataSourceManager : NSObject<NetworkManagerDelegate>
@property(nonatomic,weak)id<DataSourceManagerDelegate>delegate;

@end
