//
//  MutilsPageControllers.h
//  MultiPageControllerDemo
//
//  Created by sanmuliu on 15/3/22.
//  Copyright (c) 2015年 3KONGJIAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MutilsPageControllers : UIView

@property(nonatomic,strong)UIScrollView *showTopBarView;  //背景颜色

@property(nonatomic,assign)float lineHeight;        //线条高度 默认为2
@property(nonatomic,strong)UIColor *topBarColor;     //顶部控件背景颜色
@property(nonatomic,strong)UIColor *lineColor;      //线条颜色
@property(nonatomic,strong)UIColor *topBackGroundColor; //背景颜色

@property(nonatomic,assign)float fontSize;        //标题字体大小 默认为14
@property(nonatomic,strong)UIColor *barTextNormalColor; //正常字体颜色
@property(nonatomic,strong)UIColor *barTextSelectColor; //选中字体颜色

/**
 *  初始化
 *
 *  @param frame  
 *  @param topBarHeight
 *  @param viewControllers
 *  @param parentController
 *
 *  @return
 */
-(void)layoutSubviewsWithRect:(CGRect)frame topBarHeight:(float)topBarHeight ViewControllers:(NSArray *)viewControllers andParentController:(UIViewController *)parentController;

@end
