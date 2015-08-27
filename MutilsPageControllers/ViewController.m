//
//  ViewController.m
//  MutilsPageControllers
//
//  Created by Kuntanury on 15/8/26.
//  Copyright © 2015年 YiFengTech. All rights reserved.
//

#import "ViewController.h"
#import "TempViewController.h"

#import "MutilsPageControllers.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIStoryboard *mainStoryboard =
    [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];

    //Test1
    TempViewController *firstVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"TempVC"];
    [firstVC setTitle:@"测试页1"];
    [firstVC setVCNumber:TEST1];
    
    //Test2
    TempViewController *secondVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"TempVC"];
    [secondVC setTitle:@"测试页2"];
    [secondVC setVCNumber:TEST2];
    
    //Test3
    TempViewController *thridVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"TempVC"];
    [thridVC setTitle:@"测试页3"];
    [thridVC setVCNumber:TEST3];
    
    //Test4
    TempViewController *fourthVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"TempVC"];
    [fourthVC setTitle:@"测试页4"];
    [fourthVC setVCNumber:TEST4];
    
    NSArray *viewControllers = @[ firstVC, secondVC, thridVC, fourthVC ];
    
    MutilsPageControllers *multiPC = [[MutilsPageControllers alloc] init];
    
    [multiPC setFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20)];
    
    multiPC.lineColor = [UIColor blackColor];
    multiPC.barTextNormalColor = [UIColor redColor];
    multiPC.barTextSelectColor = [UIColor blueColor];
    
    [multiPC layoutSubviewsWithRect:CGRectMake(0, 0, self.view.frame.size.width,
                                               self.view.frame.size.height - 64 -
                                               40)
                       topBarHeight:40
                    ViewControllers:viewControllers
                andParentController:self];
    
    [self.view addSubview:multiPC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
