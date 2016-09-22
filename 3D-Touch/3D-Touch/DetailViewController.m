//
//  DetailViewController.m
//  3D-Touch
//
//  Created by lx on 2016/9/21.
//  Copyright © 2016年 sunshine. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic)  IBOutlet UITextView *textView;

@end

@implementation DetailViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"详情";
}

- (void)viewDidLoad {
    [super viewDidLoad];
 

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.textView.text = self.text;
    
}

- (NSArray <id <UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"分享" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
    }];

    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"选中" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
    }];

    UIPreviewAction *tap1 = [UIPreviewAction actionWithTitle:@"取消" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"tap 1 selected");
    }];
    
    UIPreviewAction *tap2 = [UIPreviewAction actionWithTitle:@"删除" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"tap 2 selected");
    }];
    
//    UIPreviewActionGroup *actionGroup = [UIPreviewActionGroup actionGroupWithTitle:@"actionGroup" style:UIPreviewActionStyleDefault actions:@[action1,action2,action3]];
    UIPreviewActionGroup *tapGroup = [UIPreviewActionGroup actionGroupWithTitle:@"删除" style:UIPreviewActionStyleDestructive actions:@[tap1,tap2]];
    
    NSArray *array = @[action1,action2,tapGroup];
    
    return array;
    
}





@end
