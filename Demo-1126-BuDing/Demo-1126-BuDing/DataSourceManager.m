//
//  DataSourceManager.m
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/9.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "DataSourceManager.h"
//#import "NetWorkingManager.h"
#import "APls.h"
#import "ConfigModel.h"
#import "CategoryModel.h"
#import "ImageModel.h"
#import "YYModel.h"
#import "ErrorInfo.h"

@interface DataSourceManager ()<NetworkManagerDelegate>

@end

@implementation DataSourceManager


-(void)theResponseResultWith:(NetWorkingManager *)manager andResponse:(id)response and:(ErrorInfo *)error{
    
    if ([manager.url isEqual:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",KhomePath,KCategory]]]) {
        
        NSArray *array = (NSArray *)response;
        NSMutableArray *images = [NSMutableArray array];
        
        for (NSDictionary *tempDic in array) {
            
            CategoryModel *model = [CategoryModel yy_modelWithDictionary:tempDic];
            
            [images addObject:model];
            
        }
        
        if ([self.delegate respondsToSelector:@selector(sendTheData:andManager:andError:)]) {
            [self.delegate sendTheData:images andManager:manager andError:error];
        }
        
       
    }
    
    else if ([manager.url isEqual:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",KhomePath,KConfig]]]){
        
        NSDictionary *dic = (NSDictionary *)response;
        NSMutableArray *imageUrls = [NSMutableArray array];
        NSArray *array = dic[KFeatured];
        for (NSDictionary *tempDic in array) {
            ConfigModel *model = [ConfigModel yy_modelWithDictionary:tempDic];
            
            
            [imageUrls addObject:model];
            
        }
        if ([self.delegate respondsToSelector:@selector(sendTheData:andManager:andError:)]) {
            [self.delegate sendTheData:imageUrls andManager:manager andError:error];
        }
       
    }
   
    
}

@end
