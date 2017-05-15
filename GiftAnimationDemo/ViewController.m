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

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
        weakSelf需要自己管理，这里是分开使用，避免缺少引用
     */    
    
    __weak typeof(self) weakSelf = self;
    giftView = [[GiftTableView alloc]init];
    [self.view addSubview:giftView];
    giftView.makeBottom = self.view.makeBottom - 49;
    giftView.countBlock = ^(NSUInteger number) {
        weakSelf.numberLabel.text = [NSString stringWithFormat:@"礼物队列：%ld", number];
    };
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
    model.Count = arc4random() % 100 + 1;// 随机数
    
    [giftView addGiftModel:model];
}

- (void)hide
{
    NSLog(@"cccc-%@", [NSDate date]);
}

@end
