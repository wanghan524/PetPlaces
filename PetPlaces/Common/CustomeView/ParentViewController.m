//
//  ParentViewController.m
//  PetPlaces
//
//  Created by art_kernel_zyc on 15/4/12.
//  Copyright (c) 2015年 art_kernel_zyc. All rights reserved.
//

#import "ParentViewController.h"

CGFloat navHeight;
@interface ParentViewController ()
{
    @private
    CGFloat width,height,startPointY;
    
}

@end

@implementation ParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    width = SCREEN_WIDTH;
    height = SCREEN_HEIGHT;
    if(CD_X(6))
    {
        startPointY = 0;
        navHeight = 44;
    }
    else
    if(CD(7))
    {
        startPointY = 20;
        navHeight = 64;
    }


    
}
-(void)hideCustomeNav
{
    
    
}
-(void)showCustomeNav
{
    self.lineImageView = [[UIImageView alloc]init];
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.profileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.petPlaceImageView = [[UIImageView alloc]init];
    

    [self.lineImageView setFrame:CGRectMake(0, startPointY , SCREEN_WIDTH, 5)];
    [self.lineImageView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.lineImageView];
    
    [self.backButton setFrame:CGRectMake(10, CGRectGetMaxY(self.lineImageView.frame) + 5 , 30, 30)];
    [self.backButton setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:self.backButton];
    
    CGPoint point = self.view.center;
    [self.petPlaceImageView setFrame:CGRectMake(point.x - 50, CGRectGetMaxY(self.lineImageView.frame) + 5, 100, 30)];
    
    [self.petPlaceImageView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:self.petPlaceImageView];
    

    
    [self.searchButton setFrame:CGRectMake(SCREEN_WIDTH - 45 , CGRectGetMaxY(self.lineImageView.frame) + 5 , 30, 30)];
    [self.searchButton setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:self.searchButton];
    
    [self.profileButton setFrame:CGRectMake(CGRectGetMinX(self.searchButton.frame) - 45 , CGRectGetMaxY(self.lineImageView.frame) + 5 , 30, 30)];
    [self.profileButton setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:self.profileButton];
    
    self.residuHeigth = SCREEN_HEIGHT - navHeight;
    
    [self.profileButton addTarget:self action:@selector(profileBtnClickOrGestureClip:) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
}

-(void)backBtnClick:(UIButton *)sender
{
    if([self.navigationController.viewControllers count] > 0)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

-(void)profileBtnClickOrGestureClip:(UIButton *)sender
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
