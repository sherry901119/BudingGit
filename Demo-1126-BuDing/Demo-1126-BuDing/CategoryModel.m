//
//  CategoryModel.m
//  Demo-1126-BuDing
//
//  Created by xiaohuifang on 15/12/7.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

-(id)copyWithZone:(NSZone *)zone{

    CategoryModel *model = [[CategoryModel allocWithZone:zone]init];
    model->_image = _image;
    model->_name = _name;

    return model;

}






//-(instancetype)initWithDic:(NSDictionary *)dic{
//    self = [super self];
//    if (self) {
//        NSArray *array = [dic allKeys];
//        
//        for (NSString *tempStr in array) {
//            [self setValue:dic[tempStr] forKeyPath:tempStr];
//        }
//        
//    }
//    return self;
//    
//}
////未定义的
//-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
//    NSLog(@"%@",key);
//}
////值为nil的
//-(void)setNilValueForKey:(NSString *)key{
//    
//}
@end
