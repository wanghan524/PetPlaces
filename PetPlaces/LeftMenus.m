//
//  LeftMenus.m
//  PetPlaces
//
//  Created by art_kernel_zyc on 15/4/12.
//  Copyright (c) 2015年 art_kernel_zyc. All rights reserved.
//

#import "LeftMenus.h"

@implementation LeftMenus
{
    id target;
}

-(instancetype)initWithFrame:(CGRect)frame withDelegatTarget:(id)targetObject
{
    if(self = [super initWithFrame:frame])
    {
        target = [targetObject copy];
        [self makeTableView];
    }
    return self;
}

-(void)makeTableView
{
    if(self.menusTable != nil)
    {
        self.menusTable = [[UITableView alloc]initWithFrame:CGRectMake(0, navHeight, SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT - navHeight) style:UITableViewStylePlain];
        self.menusTable.delegate = target;
        self.menusTable.dataSource = target;
        [self addSubview:self.menusTable];
    }
}

@end
