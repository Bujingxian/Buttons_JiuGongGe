//
//  SquaredUpView.h
//  Buttons_JiuGongGe
//
//  Created by 😸 on 16/3/29.
//  Copyright © 2016年 😸. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomButton;


@protocol SquaredUpViewDelegate <NSObject>

- (void)jSquaredUpViewCell:(CustomButton *)cell didSelectedAtIndex:(NSInteger)index;

@end

@interface SquaredUpView : UIView<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *classesArray;//!<存放类的数组
@property (nonatomic, strong) NSArray *squaredUpViewCellArray;//!<九宫格单元格
@property (nonatomic, strong) UIScrollView *squaredUpBGView;
@property (nonatomic, strong) UIPageControl *squaredUpViewPageControl;
@property (nonatomic,  weak ) id <SquaredUpViewDelegate> squaredUpViewDelegate;

- (CGRect)layoutSquaredUpViewCellsFrameWithModelArray:(NSArray *)modelArray;

@end
