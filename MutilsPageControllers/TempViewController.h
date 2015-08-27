//
//  TempViewController.h
//  MutilsPageControllers
//
//  Created by Kuntanury on 15/8/26.
//  Copyright © 2015年 YiFengTech. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    TEST1,
    TEST2,
    TEST3,
    TEST4
} VCNUMBER;


@interface TempViewController : UIViewController

@property (nonatomic, assign) VCNUMBER VCNumber;

@end
