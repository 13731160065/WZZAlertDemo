//
//  WZZAlertView.h
//  DuoDuoFu
//
//  Created by 王泽众 on 2018/3/24.
//  Copyright © 2018年 hongfuPay. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WZZAlertAction;

@interface WZZAlertView : UIView

/**
 弹出
 
 @param title 标题
 @param detail 详情
 */
+ (instancetype)alertWithTitle:(NSString *)title detail:(NSString *)detail actions:(NSArray <WZZAlertAction *>*)actions;

/**
 显示
 */
- (void)show;

/**
 消失
 */
- (void)dismiss;

@end

@interface WZZAlertAction : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) UIColor * titleColor;
@property (nonatomic, strong) void(^actionBlock)(WZZAlertView *);
@property (nonatomic, strong) UIButton * button;

/**
 动作
 
 @param title 标题
 @param actionBlock 回调
 @return action
 */
+ (WZZAlertAction *)actionWithTitle:(NSString *)title
                             action:(void(^)(WZZAlertView * aAlertView))actionBlock;

@end
