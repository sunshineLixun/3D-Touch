//
//  ViewController.m
//  3D-Touch
//
//  Created by lx on 2016/9/21.
//  Copyright © 2016年 sunshine. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;
@end

@implementation ViewController

#pragma mark
#pragma mark - lazy
- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"3D-Touch Objective-C",@"3D-Touch Swift",@"前言快报:Swift终将超越OC,进而取代OC",@"Github9月编程语言 JS 跃居第一位"];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"3D Touch - Peek & Pop 示例";
    self.tableView.tableFooterView = [UIView new];
    self.tableView.rowHeight = 55;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //判断设备是否支持3D-Touch
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self registerForPreviewingWithDelegate:self sourceView:self.tableView];
    }
 
}

#pragma mark
#pragma mark - UITableViewDataSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

#pragma mark
#pragma mark - UIViewControllerPreviewingDelegate
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location 
{
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (indexPath && cell) {
        previewingContext.sourceRect = cell.frame;
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        DetailViewController *detailVC = [storyboard instantiateViewControllerWithIdentifier:@"detail"];
        detailVC.text = cell.textLabel.text;
        return detailVC; 
    }else{
        return  nil;
    }
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}




@end
