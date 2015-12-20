//
//  SecondeViewController.m
//  Demo-1126-BuDing
//
//  Created by hb on 15/11/26.
//  Copyright © 2015年 xhf. All rights reserved.
//

#import "SecondeViewController.h"
#import "UIViewController+MMDrawerController.h"

@implementation SecondeViewController
-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];

    self.mm_drawerController.panGestureRecognizer.enabled = YES;

}

@end
