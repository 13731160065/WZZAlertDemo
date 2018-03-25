//
//  WZZAlertView.m
//  DuoDuoFu
//
//  Created by 王泽众 on 2018/3/24.
//  Copyright © 2018年 hongfuPay. All rights reserved.
//

#import "WZZAlertView.h"

@interface WZZAlertView () {
    UIView * updateView;
    UIView * alertV;
    NSArray <WZZAlertAction *>* actionsArr;
    NSString * thisTitle;
    NSString * thisDetail;
    CAShapeLayer * fillLayer;
}

@end

@implementation WZZAlertView

//获取实例
+ (instancetype)alertWithTitle:(NSString *)title detail:(NSString *)detail actions:(NSArray <WZZAlertAction *>*)actions {
    WZZAlertView * alert = [[WZZAlertView alloc] initWithFrame:CGRectZero];
    alert->thisTitle = title;
    alert->thisDetail = detail;
    alert->actionsArr = actions;
    return alert;
}

//显示
- (void)show {
    [self showAlertWithTitle:thisTitle message:thisDetail actions:actionsArr];
}

/**
 弹出提示
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray <WZZAlertAction *>*)actions {
    actionsArr = actions;
    [self setFrame:[UIScreen mainScreen].bounds];
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    
    updateView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:updateView];
    
    //计算文字高度
    UIFont * font = [UIFont systemFontOfSize:14];
    CGFloat alertTextHeight = [message boundingRectWithSize:CGSizeMake(280-15-15, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.height+16;
    
    NSInteger actionIdx = (actionsArr.count>2)?actionsArr.count:1;
    CGFloat alertVHeight = alertTextHeight+40+8+40*actionIdx;
    //弹框
    alertV = [[UIView alloc] initWithFrame:CGRectMake(updateView.frame.size.width/2-280/2, updateView.frame.size.height/2-alertVHeight/2, 280, alertVHeight)];
    [updateView addSubview:alertV];
    [alertV.layer setCornerRadius:10.0f];
    [alertV.layer setMasksToBounds:YES];
    [alertV setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:0.0f]];
    
    //镂空背景
    CGRect myRect = alertV.frame;
    //背景
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:updateView.bounds cornerRadius:0];
    //镂空
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:myRect cornerRadius:10];
    [path appendPath:circlePath];
    [path setUsesEvenOddFillRule:YES];
    //layer
    fillLayer = [CAShapeLayer layer];
    fillLayer.path = path.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;//中间镂空的关键点 填充规则
    fillLayer.fillColor = [UIColor blackColor].CGColor;
    fillLayer.opacity = 0.5f;
    [updateView.layer addSublayer:fillLayer];
    //动画
    CABasicAnimation * anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim.fromValue = @(0.0f);
    anim.toValue = @(0.5f);
    anim.duration = 0.2f;
    [fillLayer addAnimation:anim forKey:@"alphy1"];
    
    /*
     毛玻璃
     */
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = alertV.bounds;
    [alertV addSubview:effectView];
    
    //标题
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, alertV.frame.size.width-16, 40)];
    [alertV addSubview:titleLabel];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setText:@"温馨提示"];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:17]];
    
    //文字
    UILabel * messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(titleLabel.frame), alertV.frame.size.width-30, alertTextHeight)];
    [alertV addSubview:messageLabel];
    [messageLabel setTextAlignment:NSTextAlignmentCenter];
    [messageLabel setText:message];
    [messageLabel setFont:font];
    [messageLabel setNumberOfLines:0];
    
    UIFont * buttonFont = [UIFont systemFontOfSize:17];
    
    switch (actions.count) {
        case 0:
        {
            //取消
            UIButton * okButton = [UIButton buttonWithType:UIButtonTypeSystem];
            [okButton setFrame:CGRectMake(0, CGRectGetMaxY(messageLabel.frame)+8, alertV.frame.size.width, 40)];
            [alertV addSubview:okButton];
            [okButton.titleLabel setFont:buttonFont];
            [okButton setTitle:@"取消" forState:UIControlStateNormal];
            [okButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventAllEvents];
            
            //横线
            UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(messageLabel.frame)+8, alertV.frame.size.width, 0.7)];
            [alertV addSubview:line1];
            [line1 setBackgroundColor:[UIColor lightGrayColor]];
        }
            break;
        case 2:
        {
            //横排2
            WZZAlertAction * action = actionsArr[0];
            UIButton * cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
            [cancelButton setFrame:CGRectMake(0, CGRectGetMaxY(messageLabel.frame)+8, alertV.frame.size.width/2, 40)];
            [alertV addSubview:cancelButton];
            [cancelButton.titleLabel setFont:buttonFont];
            [cancelButton setTitle:action.title forState:UIControlStateNormal];
            action.button = cancelButton;
            [cancelButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            WZZAlertAction * action2 = actionsArr[1];
            UIButton * okButton = [UIButton buttonWithType:UIButtonTypeSystem];
            [okButton setFrame:CGRectMake(CGRectGetMaxX(cancelButton.frame), CGRectGetMaxY(messageLabel.frame)+8, alertV.frame.size.width/2, 40)];
            [alertV addSubview:okButton];
            [okButton.titleLabel setFont:buttonFont];
            [okButton setTitle:action2.title forState:UIControlStateNormal];
            action.button = okButton;
            [okButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            //横线
            UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(messageLabel.frame)+8, alertV.frame.size.width, 0.7)];
            [alertV addSubview:line1];
            [line1 setBackgroundColor:[UIColor lightGrayColor]];
            //竖线
            UIView * line2 = [[UIView alloc] initWithFrame:CGRectMake(alertV.frame.size.width/2, CGRectGetMaxY(messageLabel.frame)+8, 0.5, 40)];
            [alertV addSubview:line2];
            [line2 setBackgroundColor:[UIColor lightGrayColor]];
        }
            break;
            
        default:
        {
            //纵排
            for (int i = 0; i < actionsArr.count; i++) {
                //横线
                UIView * line1 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(messageLabel.frame)+8+40*(i), alertV.frame.size.width, 0.7)];
                [alertV addSubview:line1];
                [line1 setBackgroundColor:[UIColor lightGrayColor]];
                
                WZZAlertAction * action = actionsArr[i];
                UIButton * cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
                [cancelButton setFrame:CGRectMake(0, CGRectGetMaxY(messageLabel.frame)+8+40*i, alertV.frame.size.width, 40)];
                [alertV addSubview:cancelButton];
                [cancelButton.titleLabel setFont:buttonFont];
                [cancelButton setTitle:action.title forState:UIControlStateNormal];
                [cancelButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
                action.button = cancelButton;
            }
        }
            break;
    }
    
    [alertV setAlpha:0.0f];
    CGAffineTransform tr = updateView.transform;
    updateView.transform = CGAffineTransformScale(updateView.transform, 1.1f, 1.1f);
    [UIView animateWithDuration:0.2f animations:^{
        [alertV setAlpha:1.0f];
        updateView.transform = tr;
    }];
}

- (void)dismiss {
    [self cancelClick];
}

- (void)cancelClick {
    CABasicAnimation * anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim.fromValue = @(0.5f);
    anim.toValue = @(0.0f);
    anim.duration = 0.2f;
    [anim setRemovedOnCompletion:NO];
    [fillLayer addAnimation:anim forKey:@"alphy2"];
    //取消
    [UIView animateWithDuration:0.2f animations:^{
        [updateView setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.0f]];
        [alertV setAlpha:0.0f];
    } completion:^(BOOL finished) {
        updateView = nil;
        [self removeFromSuperview];
    }];
}

- (void)buttonClick:(UIButton *)button {
    [actionsArr enumerateObjectsUsingBlock:^(WZZAlertAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.button == button) {
            if (obj.actionBlock) {
                obj.actionBlock(self);
            }
        }
    }];
}

@end

@implementation WZZAlertAction

+ (WZZAlertAction *)actionWithTitle:(NSString *)title
                             action:(void (^)(WZZAlertView *))actionBlock {
    WZZAlertAction * action = [[WZZAlertAction alloc] init];
    action.title = title;
    action.actionBlock = actionBlock;
    return action;
}

@end
