//
//  GRStoryPanableView.m
//  GRStoryPannableViewDemo
//
//  Created by liangzhimy on 17/1/10.
//  Copyright © 2017年 liangzhimy. All rights reserved.
//

#import "GRStoryPanableView.h"
#import "GRPanableView.h"
#import "GRStoryViewCountView.h"
#import <Masonry.h>

@interface GRStoryPanableView () <GRPanableViewDelegate>

@property (strong, nonatomic) GRPanableView *storyPanableView;
@property (strong, nonatomic) GRStoryViewCountView *storyViewCountView;

@end

@implementation GRStoryPanableView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self __configUI];
    }
    return self; 
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self __configUI];
    }
    return self; 
} 

- (instancetype)init {
    if (self = [super init]) {
        [self __configUI]; 
    }
    return self; 
}

- (void)__configUI {
    [self addSubview:self.storyPanableView];
    [self.storyPanableView.headView addSubview:self.storyViewCountView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.storyPanableView.frame = self.bounds;
    [self.storyPanableView layoutIfNeeded]; 
    CGRect headBounds = self.storyPanableView.headView.bounds;
    self.storyViewCountView.center = CGPointMake(headBounds.size.width * .5, headBounds.size.height * .5);
} 

#pragma mark - property
- (GRStoryViewCountView *)storyViewCountView {
    if (!_storyViewCountView) {
        NSArray *arr = [[NSBundle bundleForClass:[GRStoryViewCountView class]] loadNibNamed:@"GRStoryViewCountView" owner:nil options:nil];
        _storyViewCountView = [arr lastObject];
    }
    return _storyViewCountView;
}

- (GRPanableView *)storyPanableView {
    if (!_storyPanableView) {
        NSArray *arr = [[NSBundle bundleForClass:[GRPanableView class]] loadNibNamed:@"GRPanableView" owner:nil options:nil];
        _storyPanableView = [arr lastObject];
        _storyPanableView.delegate = self; 
    }
    return _storyPanableView;
}

- (UIView *)containerView {
    return self.storyPanableView.containerView;
}

- (void)setViewCount:(NSInteger)viewCount {
    _viewCount = viewCount;
    self.storyViewCountView.viewCount = viewCount; 
}

#pragma mark - GRPanableViewDelegate

- (void)panableView:(GRPanableView *)panableView beginAimationWithContentViewHidden:(BOOL)hidden {
    
}

- (void)panableView:(GRPanableView *)panableView endAimationWithContentViewHidden:(BOOL)hidden {
    if (hidden) {
        [self.storyViewCountView arrowToDirecotion:GRArrowViewDirectionUp animation:YES];
    }  else {
        [self.storyViewCountView arrowToDirecotion:GRArrowViewDirectionDown animation:YES];
    }
}

@end
