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
    
    WZZAlertView * alert = [WZZAlertView alertWithTitle:@"多个按钮" detail:@"自定义两个按钮文字的弹框" actions:@[action, action2, action3]];
    [alert show];
}

@end
