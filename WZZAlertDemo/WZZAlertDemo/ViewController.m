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
    
    UIView * pv = [[UIView alloc] init];
    [self.view addSubview:pv];
    pv.translatesAutoresizingMaskIntoConstraints = NO;
    pv.backgroundColor = [UIColor lightGrayColor];
    [NSLayoutConstraint constraintWithItem:pv attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:pv attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:pv attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:500].active = YES;
    [NSLayoutConstraint constraintWithItem:pv attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:500].active = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    WZZAlertView * alert = [WZZAlertView alertWithTitle:@"多个按钮" detail:@"自定义两个按钮文字的弹框"];
    
    [alert addAction:[WZZAlertAction actionWithTitle:@"快速创建" action:^(WZZAlertView *aAlertView) {
        [aAlertView dismiss];
        
        //一个快速创建的按钮
        [[WZZAlertView alertWithTitle:@"快速创建" detail:@"快速创建一个按钮的弹框" actions:nil] show];
        
    }]];
    
    [alert addAction:[WZZAlertAction actionWithTitle:@"一个按钮" action:^(WZZAlertView *aAlertView) {
        [aAlertView dismiss];
        
        //一个按钮示范
        WZZAlertAction * action1 = [WZZAlertAction actionWithTitle:@"好的" action:^(WZZAlertView *aAlertView) {
            [aAlertView dismiss];
        }];
        WZZAlertView * alertView2 = [WZZAlertView alertWithTitle:@"一个按钮" detail:@"自定义一个按钮文字的弹框" actions:@[action1]];
        [alertView2 show];
        
    }]];
    
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
    [alert addAction:action3];
    
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
    [alert addAction:action4];
    
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
    [alert addAction:action5];
    
    [alert addAction:[WZZAlertAction actionWithTitle:@"自定义输入框" action:^(WZZAlertView *aAlertView) {
        [aAlertView dismiss];
        
        //自定义输入框示范
        WZZAlertView * alertView2 = [WZZAlertView alertWithTitle:@"加法计算" detail:nil];
        
        __block UITextField * tfa;
        __block UITextField * tfb;
        [alertView2 addTextField:[WZZAlertTextField textFieldWithConfig:^(UITextField *alertTF) {
            alertTF.placeholder = @"a";
            alertTF.keyboardType = UIKeyboardTypeNumberPad;
            tfa = alertTF;
        }]];
        [alertView2 addTextField:[WZZAlertTextField textFieldWithConfig:^(UITextField *alertTF) {
            alertTF.placeholder = @"b";
            alertTF.keyboardType = UIKeyboardTypeNumberPad;
            tfb = alertTF;
        }]];
        
        [alertView2 addAction:[WZZAlertAction actionWithTitle:@"计算" action:^(WZZAlertView *aAlertView) {
            [aAlertView dismiss];
            NSInteger num = tfa.text.integerValue+tfb.text.integerValue;
            [[WZZAlertView alertWithTitle:@"计算结果" detail:@(num).stringValue] show];
        }]];
        
        [alertView2 show];
    }]];
    
    [alert show];
}

@end
