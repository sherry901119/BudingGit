//
//  NetWorkingManager.m
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/8.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "NetWorkingManager.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "ErrorInfo.h"


@implementation NetWorkingManager
-(void)networkManagerWithUrl:(NSString *)urlString andPara:(NSDictionary *)para{

    _url = [NSURL URLWithString:urlString];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain", nil];

    manager.requestSerializer.timeoutInterval = 15;
    
    [manager GET:urlString parameters:para success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        if ([self.delegate respondsToSelector:@selector(theResponseResultWith:andResponse:and:)]) {
            [self.delegate theResponseResultWith:self andResponse:responseObject and:nil];
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        ErrorInfo *errorInfo = [[ErrorInfo alloc]initWithError:error];

        
        if ([self.delegate respondsToSelector:@selector(theResponseResultWith:andResponse:and:)]) {
            [self.delegate theResponseResultWith:self andResponse:nil and:errorInfo];
        }
        
    }];


}
 
@end
