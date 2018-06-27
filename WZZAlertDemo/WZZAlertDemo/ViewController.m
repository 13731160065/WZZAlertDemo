//
//  ViewController.m
//  WZZAlertDemo
//
//  Created by 王泽众 on 2018/6/13.
//  Copyright © 2018年 王泽众. All rights reserved.
//

#import "ViewController.h"
#import "WZZAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    WZZAlertAction * action = [WZZAlertAction actionWithTitle:@"快速创建" action:^(WZZAlertView *aAlertView) {
        [aAlertView dismiss];
        
        //一个快速创建的按钮
        [[WZZAlertView alertWithTitle:@"快速创建" detail:@"快速创建一个按钮的弹框" actions:nil] show];
        
    }];
    
    WZZAlertAction * action2 = [WZZAlertAction actionWithTitle:@"一个按钮" action:^(WZZAlertView *aAlertView) {
        [aAlertView dismiss];
        
        //一个按钮示范
        WZZAlertAction * action1 = [WZZAlertAction actionWithTitle:@"好的" action:^(WZZAlertView *aAlertView) {
            [aAlertView dismiss];
        }];
        WZZAlertView * alertView2 = [WZZAlertView alertWithTitle:@"一个按钮" detail:@"自定义一个按钮文字的弹框" actions:@[action1]];
        [alertView2 show];
        
    }];
    
    WZZAlertAction * action3 = [WZZAlertAction actionWithTitle:@"两个按钮" action:^(WZZAlertView *aAlertView) {
        [aAlertView dismiss];
        
        //两个按钮效果
        WZZAlertAction * action1 = [WZZAlertAction actionWithTitle:@"好的" action:^(WZZAlertView *aAlertView) {
            [aAlertView dismiss];
        }];
        WZZAlertAction * action2 = [WZZAlertAction actionWithTitle:@"好的" action:^(WZZAlertView *aAlertView) {
            [aAlertView dismiss];
        }];
        WZZAlertView * alert2 = [WZZAlertView alertWithTitle:@"一个按钮" detail:@"自定义两个按钮文字的弹框" actions:@[action1, action2]];
        [alert2 show];
        
    }];
    action3.titleColor = [UIColor redColor];
    
    WZZAlertAction * action4 = [WZZAlertAction actionWithTitle:@"没有标题" action:^(WZZAlertView *aAlertView) {
        [aAlertView dismiss];
        
        //一个按钮示范
        WZZAlertAction * action1 = [WZZAlertAction actionWithTitle:@"好的" action:^(WZZAlertView *aAlertView) {
            [aAlertView dismiss];
        }];
        WZZAlertView * alertView2 = [WZZAlertView alertWithTitle:nil detail:@"自定义一个没有标题的弹框" actions:@[action1]];
        [alertView2 show];
        
    }];
    action4.titleColor = [UIColor lightGrayColor];
    
    WZZAlertAction * action5 = [WZZAlertAction actionWithTitle:@"没有描述" action:^(WZZAlertView *aAlertView) {
        [aAlertView dismiss];
        
        //一个按钮示范
        WZZAlertAction * action1 = [WZZAlertAction actionWithTitle:@"好的" action:^(WZZAlertView *aAlertView) {
            [aAlertView dismiss];
        }];
        WZZAlertView * alertView2 = [WZZAlertView alertWithTitle:@"一个没有描述的弹框" detail:nil actions:@[action1]];
        [alertView2 show];
        
    }];
    action5.titleColor = [UIColor orangeColor];
    
    WZZAlertView * alert = [WZZAlertView alertWithTitle:@"多个按钮" detail:@"自定义两个按钮文字的弹框" actions:@[action, action2, action3, action4, action5]];
    [alert show];
}

@end
