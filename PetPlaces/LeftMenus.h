//
//  LeftMenus.h
//  PetPlaces
//
//  Created by art_kernel_zyc on 15/4/12.
//  Copyright (c) 2015年 art_kernel_zyc. All rights reserved.
//

#import <UIKit/UIKit.h>
extern CGFloat navHeight;
@interface LeftMenus : UIView
@property(nonatomic,strong)NSMutableArray *menuArray;
@property(nonatomic,strong)UITableView *menusTable;
-(instancetype)initWithFrame:(CGRect)frame;

@end
