//
//  ViewController.m
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/11.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CKFrame.h"
#import "GiftTableView.h"

@interface ViewController () {
    GiftTableView *giftView;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    giftView = [[GiftTableView alloc]init];
//    giftView.backgroundColor = [UIColor redColor];
    [self.view addSubview:giftView];
    giftView.makeBottom = self.view.makeBottom - 49;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action:(id)sender {
    static int i = 0;
    
    GiftModel *model = [GiftModel new];
    model.Id = [NSNumber numberWithInteger:i];
    model.UserName = @"土豪们";
    model.GiftName = @"送出代码段";
    model.Count = arc4random() % 5 + 1;// 随机数
    
    [giftView addGiftModel:model];
}


@end
