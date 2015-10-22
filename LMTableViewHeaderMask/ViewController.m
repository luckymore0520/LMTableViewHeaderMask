//
//  ViewController.m
//  LMTableViewHeaderMask
//
//  Created by Kun Wang on 15/10/20.
//  Copyright © 2015年 luckymore. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewCell+Mask.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    headerView.backgroundColor = [UIColor clearColor];
    CGRect labelFrame = CGRectMake(12, 0, headerView.frame.size.width - 12 , 20);
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:labelFrame];
    titleLabel.text = [NSString stringWithFormat:@"SECTION%ld",section];
    [titleLabel setTextColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.3]];
    [headerView addSubview:titleLabel];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell maskCellFromTop:0];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    UITableView* tableView = (UITableView*)scrollView;
    //遍历TableView中所有显示的cell
    for (UITableViewCell *cell in tableView.visibleCells) {
        //计算需要隐藏的高度：当前scrollView的contentOffset的y坐标＋Header的高度－cell的y坐标
        CGFloat hiddenFrameHeight = scrollView.contentOffset.y + 20 - cell.frame.origin.y;
        if (hiddenFrameHeight >= 0 && hiddenFrameHeight <= cell.frame.size.height) {
            //该方法用于对cell设置mask
            [cell maskCellFromTop:hiddenFrameHeight];
        }
    }
}
@end
