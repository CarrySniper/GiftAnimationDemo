//
//  GiftTableView.m
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/11.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

#import "GiftTableView.h"
#import "GiftOperation.h"

#define HeightOfCell        50.0
#define WidthOfView         160.0
#define NumberOfRow         5 //_dataArray实例化时减1个，礼物从最后面插入。

@interface GiftTableView() <UITableViewDelegate, UITableViewDataSource> {
    __block NSOperationQueue *_opQueue;
}

@end

@implementation GiftTableView

#pragma mark 初始化
- (instancetype)init
{
    CGRect rect = CGRectMake(0, 0, WidthOfView, HeightOfCell * NumberOfRow);
    self = [super initWithFrame:rect style:UITableViewStylePlain];
    if (self) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.userInteractionEnabled = NO;
        self.clipsToBounds = NO;
        self.backgroundColor = [UIColor clearColor];
        self.dataSource = self;
        self.delegate = self;
        self.rowHeight = HeightOfCell;
        // xib注册
        [self registerNib:[UINib nibWithNibName:@"GiftViewCell" bundle:nil] forCellReuseIdentifier:@"GiftViewCell"];

        // 代码注册
        //[self registerClass:[GiftViewCell class] forCellReuseIdentifier:@"GiftViewCell"];
        
        _dataArray = [NSMutableArray array];
        for (int i = 1; i < NumberOfRow; i++) {
            [_dataArray addObject:[NSNull null]];
        }
        
        _opQueue = [[NSOperationQueue alloc] init];
        _opQueue.maxConcurrentOperationCount = NumberOfRow; // 最大并发量
    }
    return self;
}

#pragma mark 为队列添加礼物展示
- (void)addGiftModel:(GiftModel *)model
{
    __weak typeof(self) weakSelf = self;
    // 动画时间，要和cell有个同步时间
    NSTimeInterval duration = [model totalTime];
    GiftOperation *operation = [GiftOperation animateWithDuration:duration startBlock:^{
        [_dataArray addObject:model];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_dataArray.count-1 inSection:0];
        [weakSelf beginUpdates];
        [weakSelf insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        [weakSelf endUpdates];
        
        [weakSelf scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
        
    } endBlock:^{
        if (_dataArray.count > NumberOfRow - 1) {// 预防反向滚动，当没有更多礼物了，就可以保留着先
            NSInteger row = [_dataArray indexOfObject:model];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
            [_dataArray removeObjectAtIndex:row];
            [weakSelf beginUpdates];
            [weakSelf deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            [weakSelf endUpdates];
        }
        // block 礼物数量
        if (weakSelf.countBlock) {
            weakSelf.countBlock(_opQueue.operationCount-1);
        }
    }];
    [_opQueue addOperation:operation];
    
    // block 礼物数量
    if (weakSelf.countBlock) {
        weakSelf.countBlock(_opQueue.operationCount);
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GiftViewCell *cell = (GiftViewCell *)[tableView dequeueReusableCellWithIdentifier:@"GiftViewCell"];

    [cell setGiftObject:_dataArray[indexPath.row]];
    
    return cell;
}

@end
