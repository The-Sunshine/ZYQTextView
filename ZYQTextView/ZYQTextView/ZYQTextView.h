//
//  ZYQTextView.h
//  ZYQTextView
//
//  Created by bjzyzl on 2017/8/8.
//  Copyright © 2017年 zyq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZYQTextViewDelegate <NSObject>

@optional
-(void)didChangeClick;
-(void)beginEditingClick;
-(void)endEditingClick;

@end


@interface ZYQTextView : UITextView

/** 预显示字段的字体大小 */
@property (nonatomic,strong) UIFont   * placeholderFont;

/** 预显示字段的字体颜色 */
@property (nonatomic,strong) UIColor  * placeholderColor;

/** textView字体颜色 */
@property (nonatomic,strong) UIColor  * textcolor;

/** textView字体大小 */
@property (nonatomic,strong) UIFont   * textfont;

/** 预显示字段 */
@property (nonatomic,copy)   NSString * placeholder;

/** 自适应高度属性 默认关闭 */
@property (nonatomic,assign) BOOL       autoHeight;

/** 代理 */
@property (nonatomic,assign) id<ZYQTextViewDelegate> editDelegate;

@end
