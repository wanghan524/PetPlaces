//
//  MainViewController.h
//  PetPlaces
//
//  Created by art_kernel_zyc on 15/4/12.
//  Copyright (c) 2015年 art_kernel_zyc. All rights reserved.
//

#import "ParentViewController.h"
extern CGFloat navHeight;
@interface MainViewController : ParentViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)NSMutableArray *imageArray;

@property(nonatomic,strong)UICollectionView *collectionView;

@property(nonatomic,strong)UIButton *bottomButton;

@end
