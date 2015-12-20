//
//  LeftViewController.m
//  Demo-1126-BuDing
//
//  Created by hb on 15/11/26.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "LeftViewController.h"
#import "CustomTableViewCell.h"
#import "CustomFooterView.h"
#import "CustomHeaderView.h"

#import "Masonry.h"

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>
{


    UITableView *_tableView;
    NSArray *_titleList;

}

@end

@implementation LeftViewController
-(void)viewDidLoad{
    
    [super viewDidLoad];
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"cellId"];
    [self.view addSubview:_tableView];
    
    _tableView.rowHeight = 56;
    
    //tableview不会移动了
    _tableView.scrollEnabled = NO;
    
    //隐藏线条
    _tableView.separatorStyle = NO;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, self.view.frame.size.height)];
    
    _tableView.backgroundView = imageView;
    imageView.image = [UIImage imageNamed:@"BGI_1.jpg"];
    
#pragma mark - 设置header
    CustomHeaderView *headerView = [[CustomHeaderView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    headerView.headerTitle = @"hello_world";
    headerView.followCount = @"20";
    headerView.fansCount = @"10";
    headerView.isLogin = YES;

    _tableView.tableHeaderView = headerView;

    [headerView headButtonClicked:^(UIButton *button,NSInteger index) {
        NSLog(@"header%ld",index);
    }];
    
#pragma mark - 设置footer
    CustomFooterView *view = [[CustomFooterView alloc]initWithFrame:CGRectMake(0, 0, 100, 200)];

    _tableView.tableFooterView = view;
    
    [view buttonClickedBlock:^(UIButton *sender,NSInteger index) {
        
        NSInteger ltag = index;
        NSLog(@"%ld",ltag);
    
    }];
    

   
    UIImage *image = [UIImage imageNamed:@"zhuifan"];
    UIImage *image2 = [UIImage imageNamed:@"cloud"];
    UIImage *image3 = [UIImage imageNamed:@"tongji"];
    UIImage *image4 = [UIImage imageNamed:@"zhoubian"];
    
    NSDictionary *imageAndTitle1 = [NSDictionary dictionaryWithObjects:@[image,@"追番记录"] forKeys:@[@"image",@"title"]];
    NSDictionary *imageAndTitle2 = [NSDictionary dictionaryWithObjects:@[image2,@"离线缓存"] forKeys:@[@"image",@"title"]];
    NSDictionary *imageAndTitle3 = [NSDictionary dictionaryWithObjects:@[image3,@"布丁统计"] forKeys:@[@"image",@"title"]];
    NSDictionary *imageAndTitle4 = [NSDictionary dictionaryWithObjects:@[image4,@"布丁娘送周边"] forKeys:@[@"image",@"title"]];
    
    _titleList = @[imageAndTitle1,imageAndTitle2,imageAndTitle3,imageAndTitle4];
    
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor clearColor];
    
    NSDictionary *tempDic = _titleList[indexPath.row];
    
    cell.title = tempDic[@"title"];
    cell.headImage = tempDic[@"image"];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 4;

}

@end
