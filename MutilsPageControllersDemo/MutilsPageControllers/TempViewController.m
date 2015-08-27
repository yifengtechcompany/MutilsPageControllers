//
//  TempViewController.m
//  MutilsPageControllers
//
//  Created by Kuntanury on 15/8/26.
//  Copyright © 2015年 YiFengTech. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation TempViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_numberLabel setText:[NSString stringWithFormat:@"%lu",(unsigned long)_VCNumber]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
