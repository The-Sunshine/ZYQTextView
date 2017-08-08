//
//  ZYQTextView.m
//  ZYQTextView
//
//  Created by bjzyzl on 2017/8/8.
//  Copyright © 2017年 zyq. All rights reserved.
//

#import "ZYQTextView.h"

@interface ZYQTextView ()<UITextViewDelegate>

@end

@implementation ZYQTextView
{
    UILabel * _placeholderLabel;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initialization];
        [self initUI];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initialization];
    [self initUI];
}

-(void)initialization
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didChange:) name:UITextViewTextDidChangeNotification object:self];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(beginNoti:) name:UITextViewTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(endNoti:) name:UITextViewTextDidEndEditingNotification object:nil];
    
    _placeholderFont = [UIFont systemFontOfSize:13];
    _placeholderColor = [UIColor lightGrayColor];
    _textcolor = [UIColor blackColor];
    _textfont = [UIFont systemFontOfSize:13];
    
}

-(void)initUI
{
    UILabel * placeholderLabel = [[UILabel alloc]init];
    placeholderLabel.font = _placeholderFont;
    placeholderLabel.textColor = _placeholderColor;
    [self addSubview:placeholderLabel];
    _placeholderLabel = placeholderLabel;
}

-(void)layoutSubviews
{
    _placeholderLabel.frame = (CGRect){ 5, 0,(self.frame.size.width - 10) / 2, 30};
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
#pragma mark - UITextViewNotification
-(void)didChange:(NSNotification *)noti
{
    _placeholderLabel.hidden = self.text.length > 0 ? YES : NO;
    
    if (_autoHeight) {
        
        self.scrollEnabled = NO;
        float tvHeight = [self sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)].height;
        
        if (tvHeight > self.frame.size.height) {
            
            CGRect frame = self.frame;
            frame.size.height = tvHeight;
            self.frame = frame;
        }
    }
    [self.editDelegate didChangeClick];
}

-(void)beginNoti:(NSNotification *)noti
{
    [self.editDelegate beginEditingClick];
}

-(void)endNoti:(NSNotification *)noti
{
    [self.editDelegate endEditingClick];
}

#pragma mark - setter
-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderLabel.textColor = placeholderColor;
}

-(void)setPlaceholderFont:(UIFont *)placeholderFont
{
    _placeholderLabel.font = placeholderFont;
}

-(void)setFont:(UIFont *)font
{
    self.font = font;
}

-(void)setTextColor:(UIColor *)textColor
{
    self.textColor = textColor;
}

-(void)setText:(NSString *)text
{
    _placeholderLabel.hidden = text.length > 0 ? YES : NO;
}
-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholderLabel.text = placeholder;
}
@end
