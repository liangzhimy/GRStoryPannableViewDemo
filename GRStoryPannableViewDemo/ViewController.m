//
//  ViewController.m
//  GRStoryPannableViewDemo
//
//  Created by liangzhimy on 17/1/9.
//  Copyright © 2017年 liangzhimy. All rights reserved.
//

#import "ViewController.h"
#import "GRPanableView.h"
#import "GRStoryViewCountView.h"
#import "GRStoryPanableView.h"
#import <Masonry.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) GRPanableView *storyPanContainerView;
@property (strong, nonatomic) GRStoryViewCountView *viewCountView;
@property (strong, nonatomic) GRStoryPanableView *storyPanableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.containerView layoutIfNeeded];
    self.storyPanableView = [[GRStoryPanableView alloc] initWithFrame:self.containerView.bounds];
    [self.containerView addSubview:self.storyPanableView];
    [self.storyPanableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView);
    }];
    
    self.storyPanableView.viewCount = 1000; 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (GRStoryViewCountView *)viewCountView {
    if (!_viewCountView) {
        NSArray *arr = [[NSBundle bundleForClass:[GRStoryViewCountView class]] loadNibNamed:@"GRStoryViewCountView" owner:nil options:nil];
        _viewCountView = [arr lastObject];
    }
    return _viewCountView;
}

- (GRPanableView *)storyPanContainerView {
    if (!_storyPanContainerView) {
        NSArray *arr = [[NSBundle bundleForClass:[GRPanableView class]] loadNibNamed:@"GRPanableView" owner:nil options:nil];
        _storyPanContainerView = [arr lastObject];
    }
    return _storyPanContainerView;
}

@end
