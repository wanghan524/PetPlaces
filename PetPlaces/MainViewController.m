//
//  MainViewController.m
//  PetPlaces
//
//  Created by art_kernel_zyc on 15/4/12.
//  Copyright (c) 2015年 art_kernel_zyc. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self showCustomeNav];
    [self makeArray];
    [self makeCollectionView];
    [self makeBottomButton];
    
}

-(void)profileBtnClickOrGestureClip:(UIButton *)sender
{
    
}
-(void)makeBottomButton
{
    self.bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bottomButton setFrame:CGRectMake(0, CGRectGetMaxY(self.collectionView.frame), SCREEN_WIDTH, 70)];
    [self.bottomButton setTitle:@"FREE PET ADVICE" forState:UIControlStateNormal];
    [self.bottomButton setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.bottomButton];
}

-(void)makeArray
{
    self.imageArray = [[NSMutableArray alloc]initWithCapacity:0];
    for(NSUInteger i = 0; i < 6; i++)
    {
        [self.imageArray addObject:[NSString stringWithFormat:@"%lu",(unsigned long)i]];
    }
}

#pragma mark collection delegate start
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.imageArray count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *iden = @"UICollectionViewCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:iden forIndexPath:indexPath];
    if(cell == nil)
    {
        cell = [[UICollectionViewCell alloc]initWithFrame:CGRectMake(0,0,SCREEN_WIDTH/2, (self.residuHeigth - 100)/(self.imageArray.count))];
    }
    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    label.textColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    for (id subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    [cell.contentView addSubview:label];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH/2, (self.residuHeigth - 70)/((self.imageArray.count)/2));
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DLog(@"%@",indexPath);
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark collection delegate end

-(void)makeCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setItemSize:CGSizeMake(SCREEN_WIDTH/2, (self.residuHeigth - 70)/((self.imageArray.count)/2))];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,navHeight, SCREEN_WIDTH, self.residuHeigth - 70) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:self.collectionView];
    
}
@end
