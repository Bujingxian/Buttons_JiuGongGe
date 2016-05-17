//
//  CustomButton.m
//  Buttons_JiuGongGe
//
//  Created by 😸 on 16/3/3.
//  Copyright © 2016年 😸. All rights reserved.
//

#import "CustomButton.h"

#define IMGandTIT_Ratio (2.0/3.0)

@implementation CustomButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imgViewWidth = contentRect.size.width;
    CGFloat imgViewHeight = contentRect.size.height * IMGandTIT_Ratio;
    
    return CGRectMake(0, 0, imgViewWidth, imgViewHeight);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titley = contentRect.size.height * IMGandTIT_Ratio;
    CGFloat titleViewWidth = contentRect.size.width;
    CGFloat titleViewHeight = contentRect.size.height - titley;
    
    return CGRectMake(- titleViewWidth * 0.2, titley, titleViewWidth * (1 + 0.2 * 2), titleViewHeight);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
