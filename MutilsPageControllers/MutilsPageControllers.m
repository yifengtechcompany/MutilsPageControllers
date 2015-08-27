//
//  MutilsPageControllers.m
//  MultiPageControllerDemo
//
//  Created by sanmuliu on 15/3/22.
//  Copyright (c) 2015年 3KONGJIAN. All rights reserved.
//

#import "MutilsPageControllers.h"

@interface MutilsPageControllers ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *pageControllerScrollView;

@property(nonatomic,strong)UIButton *lastButton;
@property(nonatomic,assign)int currentPage;
@property(nonatomic,strong)UIImageView *lineImageView;

@property(nonatomic,strong)UIViewController *currentViewController;
@property(nonatomic,strong)NSArray *allViewControllers;
@property(nonatomic,strong)UIViewController *parentController;

@end

@implementation MutilsPageControllers

-(void)layoutSubviewsWithRect:(CGRect)frame topBarHeight:(float)topBarHeight ViewControllers:(NSArray *)viewControllers andParentController:(UIViewController *)parentController{
    
    _allViewControllers = viewControllers;
    _parentController = parentController;
    
    if (_lineHeight == 0) {
        _lineHeight = 2;
    }
    
    if (_fontSize == 0) {
        _fontSize = 14;
    }
    
    UIScrollView *topBarScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, topBarHeight)];
    _showTopBarView = topBarScrollView;
    topBarScrollView.backgroundColor = _topBarColor;
    topBarScrollView.showsHorizontalScrollIndicator = NO;
    topBarScrollView.showsVerticalScrollIndicator = NO;
    
    int viewWidth = frame.size.width/viewControllers.count;
    if (viewWidth < 64) {
        viewWidth = 64;
    }
    
    for (int index = 0; index < viewControllers.count; index++) {
        UIButton *showStyleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIViewController *viewController = viewControllers[index];
        [showStyleButton setTitle:viewController.title forState:UIControlStateNormal];
        [showStyleButton addTarget:self action:@selector(showStyleButtonActions:) forControlEvents:UIControlEventTouchUpInside];
        showStyleButton.tag = 4000 +index;
        if (_barTextNormalColor == nil) {
            _barTextNormalColor = [UIColor whiteColor];
        }
        if (_barTextSelectColor == nil) {
            _barTextSelectColor = [UIColor redColor];
        }
        showStyleButton.backgroundColor = [UIColor clearColor];
        [showStyleButton setTitleColor:_barTextNormalColor forState:UIControlStateNormal];
        [showStyleButton setTitleColor:_barTextNormalColor forState:UIControlStateHighlighted];
        [showStyleButton setTitleColor:_barTextSelectColor forState:UIControlStateSelected];
        showStyleButton.titleLabel.font = [UIFont systemFontOfSize:_fontSize];
        
        ;
        
        showStyleButton.frame  = CGRectMake(index*viewWidth, 0, viewWidth, topBarHeight);
        if (index == 0) {
            showStyleButton.selected = YES;
            _lastButton = showStyleButton;
            UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(viewWidth/2-50/2, topBarHeight-_lineHeight,50 , _lineHeight)];
            _lineImageView = lineImageView;
            lineImageView.backgroundColor = _lineColor;
            [topBarScrollView addSubview:lineImageView];
        }
        [topBarScrollView addSubview:showStyleButton];
    }
    topBarScrollView.contentSize = CGSizeMake(viewWidth*viewControllers.count, topBarHeight);
    [self addSubview:topBarScrollView];
    
    _pageControllerScrollView = [[UIScrollView alloc]init];
    _pageControllerScrollView.frame = CGRectMake(0, topBarHeight, self.frame.size.width, self.frame.size.height-topBarHeight);
    _pageControllerScrollView.delegate = self;
    _pageControllerScrollView.backgroundColor = [UIColor clearColor];
    _pageControllerScrollView.userInteractionEnabled =YES;
    _pageControllerScrollView.pagingEnabled = YES;
    _pageControllerScrollView.contentSize = CGSizeMake(viewControllers.count*self.frame.size.width, self.frame.size.height-topBarHeight);
    _pageControllerScrollView.bounces = NO;
    [self addSubview:_pageControllerScrollView];
    
    
    for (int index = 0; index<viewControllers.count;index++) {
        UIViewController *viewController = viewControllers[index];
        viewController.view.tag = index;
        [parentController addChildViewController:viewController];
        viewController.view.frame = CGRectMake(index*parentController.view.frame.size.width,0, CGRectGetWidth(_pageControllerScrollView.frame), frame.size.height-40);
        
        if (index == 0) {
            _currentViewController = viewController;
        }
    }
    [_currentViewController didMoveToParentViewController:parentController];
    [_pageControllerScrollView addSubview:_currentViewController.view];

}

-(void)showStyleButtonActions:(UIButton *)button{
    int buttonIndex = (int)button.tag - 4000;
    
    if (![button isEqual:_lastButton]) {
        
        UIViewController *willShowController = _allViewControllers[buttonIndex];
        UIView *subView = [_pageControllerScrollView viewWithTag:buttonIndex];
        if (subView == nil) {
            [willShowController didMoveToParentViewController:_parentController];
            [_pageControllerScrollView addSubview:willShowController.view];
            willShowController.view.tag = _currentPage;
        }


        if (abs((int)button.tag - (int)_lastButton.tag) <= 1) {
            [_pageControllerScrollView scrollRectToVisible:CGRectMake(buttonIndex*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height) animated:NO];
        }else{
            [_pageControllerScrollView scrollRectToVisible:CGRectMake(buttonIndex*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height) animated:NO];
        }
        
        [UIView animateWithDuration:0.2 animations:^{
            _lineImageView.frame = CGRectMake(button.frame.origin.x+ button.frame.size.width/2-50/2, button.frame.size.height-2, 50, 2);
        }];
        
        button.selected = YES;
        _lastButton.selected = NO;
        _lastButton = button;
    }
}





-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = _pageControllerScrollView.frame.size.width;
    int currentPaged = floorf((_pageControllerScrollView.contentOffset.x -pageWidth/2)/pageWidth)+1;
    
    _currentPage = currentPaged;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    UIViewController *willShowController = _allViewControllers[_currentPage];
    UIView *subView = [_pageControllerScrollView viewWithTag:_currentPage];
    if (subView == nil) {
        [willShowController didMoveToParentViewController:_parentController];
        [_pageControllerScrollView addSubview:willShowController.view];
        willShowController.view.tag = _currentPage;
    }
    
    UIButton *selectButton = (UIButton *)[_showTopBarView viewWithTag:_currentPage+4000];
    if ([selectButton isEqual:_lastButton]) {
        return;
    }
    [UIView animateWithDuration:0.2 animations:^{
        _lineImageView.frame = CGRectMake(selectButton.frame.origin.x+selectButton.frame.size.width/2-50/2, _lineImageView.frame.origin.y, 50, _lineImageView.frame.size.height);
    }];
    selectButton.selected = YES;
    _lastButton.selected = NO;
    _lastButton = selectButton;
}






@end
