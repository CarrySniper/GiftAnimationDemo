//
//  GiftTableView.m
//  GiftAnimationDemo
//
//  Created by BmMac on 2017/5/11.
//  Copyright © 2017年 IBEIMEN. All rights reserved.
//

#import "GiftTableView.h"
#import "GiftOperation.h"
#import "GiftViewCell.h"

#define HeightOfCell        44.0
#define WidthOfView         120.0
#define NumberOfRow         3 //_dataArray实例化时减1个，礼物从最后面插入。

@interface GiftTableView() <UITableViewDelegate, UITableViewDataSource> {
   
    NSMutableArray *_dataArray;
    NSOperationQueue *_opQueue;
}

@end

@implementation GiftTableView

- (instancetype)init
{
    CGRect rect = CGRectMake(0, 0, WidthOfView, HeightOfCell * NumberOfRow);
    self = [super initWithFrame:rect style:UITableViewStylePlain];
    if (self) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor clearColor];
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[GiftViewCell class] forCellReuseIdentifier:@"GiftViewCell"];
        
        _dataArray = [NSMutableArray arrayWithObjects:[NSNull null], [NSNull null], nil];
        
        _opQueue = [[NSOperationQueue alloc] init];
        _opQueue.maxConcurrentOperationCount = NumberOfRow; // 最大并发量
    }
    return self;
}

- (void)addGiftObject:(NSObject *)object
{
    int x = arc4random() % 5 + 1;
    GiftOperation *operation = [GiftOperation animateWithDuration:x startBlock:^{
        [_dataArray addObject:[NSNumber numberWithInteger:x]];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_dataArray.count-1 inSection:0];
        [self beginUpdates];
        [self insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        [self endUpdates];
        
        [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
    } endBlock:^{
        if (_opQueue.operationCount > 3) {// 预防反向滚动，当没有更多礼物了，就可以保留着先
            NSNumber *obj = [NSNumber numberWithInteger:x];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[_dataArray indexOfObject:obj] inSection:0];
            [_dataArray removeObjectAtIndex:[_dataArray indexOfObject:obj]];
            [self beginUpdates];
            [self deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            [self endUpdates];
        }
    }];
    [_opQueue addOperation:operation];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GiftViewCell *cell = (GiftViewCell *)[tableView dequeueReusableCellWithIdentifier:@"GiftViewCell"];
    cell.backgroundColor = [UIColor clearColor];

    if (![_dataArray[indexPath.row] isKindOfClass:[NSNull class]]) {
        NSInteger time = [_dataArray[indexPath.row] integerValue];
        [cell animateWithDuration:time giftObject:_dataArray[indexPath.row]];
    }
    
    return cell;
}

@end
