//
//  SquaredUpView.m
//  Buttons_JiuGongGe
//
//  Created by 😸 on 16/3/29.
//  Copyright © 2016年 😸. All rights reserved.
//

#import "SquaredUpView.h"
#import "CustomButton.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width

@implementation SquaredUpView

- (CGRect)layoutSquaredUpViewCellsFrameWithModelArray:(NSArray *)modelArray {
    self.classesArray = modelArray;
    
    //  判断将有几页要显示
    NSUInteger pages = 0;
    if (modelArray.count%8 == 0) {
        pages = modelArray.count/8;
    }else{
        pages = 1 + modelArray.count/8;
    }
    
    //  页面内Btn大小、间距等
    CGFloat intervalX = 35.0;/**<横向间隔*/
    CGFloat intervalY = 10.0;/**<纵向间隔*/
    NSInteger columnNum = 4;/**<九宫格列数*/
    CGFloat widthAndHeightRatio = 2.0/3.0;/**<宽高比*/
    CGFloat buttonWidth = (WIDTH - 40 - intervalX * (columnNum - 1))/(CGFloat)columnNum;/**<button的宽度*/
    CGFloat buttonHeight = buttonWidth/widthAndHeightRatio;/**<button的高度*/
    
    //  遍历button数组并设置每个button的Frame
    [self.squaredUpViewCellArray enumerateObjectsUsingBlock:^(CustomButton  *button, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (idx <= 7) {
//            button.frame = CGRectMake(20 + (buttonWidth + intervalX) * (idx%4), intervalY + (buttonHeight + intervalY) * (idx/4), buttonWidth, buttonHeight);
//        }else if (idx <= 15) {
//            button.frame = CGRectMake(WIDTH + 20 + (buttonWidth + intervalX) * ((idx - 8)%4), intervalY + (buttonHeight + intervalY) * ((idx - 8)/4), buttonWidth, buttonHeight);
//        }else if (idx <= 23) {
//            button.frame = CGRectMake( WIDTH*2 + 20 + (intervalX + buttonWidth) * ((idx - 16)%4), intervalY + (buttonHeight + intervalY)*((idx - 16)/4), buttonWidth, buttonHeight);
//        }else{
//            button.frame = CGRectZero;
//        }
        
        //算法2.0版本
        NSUInteger page = idx/8;//!<基于数组中元素的索引值，每个图标所在的页
        button.frame = CGRectMake(20 + (buttonWidth + intervalX) * (idx % 4) + WIDTH * page, intervalY + (buttonHeight + intervalY) * ((idx - page * 8) / 4), buttonWidth, buttonHeight);
        
        button.imageView.backgroundColor = [UIColor redColor];
        button.titleLabel.backgroundColor = [UIColor greenColor];
        
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button addTarget:self.squaredUpViewDelegate action:@selector(jSquaredUpViewCell:didSelectedAtIndex:) forControlEvents:UIControlEventTouchUpInside];
        
    }];
    
    if (pages <= 1) {
        if (modelArray.count%4 == 0) {
            self.squaredUpBGView.contentSize = CGSizeMake(WIDTH, intervalY + (buttonHeight + intervalY)*(modelArray.count/4));
            self.squaredUpBGView.frame = CGRectMake(0, 0, WIDTH, intervalY + (buttonHeight + intervalY)*(modelArray.count/4));
            self.frame = CGRectMake(0, 0, WIDTH, intervalY + (buttonHeight + intervalY)*(modelArray.count/4));
        }else{
            self.squaredUpBGView.contentSize = CGSizeMake(WIDTH, intervalY + (buttonHeight + intervalY)*(1 + modelArray.count/4));
            self.squaredUpBGView.frame = CGRectMake(0, 0, WIDTH, intervalY + (buttonHeight + intervalY)*(1 + modelArray.count/4));
            self.frame = CGRectMake(0, 0, WIDTH, intervalY + (buttonHeight + intervalY)*(1 + modelArray.count/4));
        }
    }else{
        self.squaredUpBGView.contentSize = CGSizeMake(WIDTH * pages, intervalY + (buttonHeight + intervalY)*2);
        self.squaredUpBGView.frame = CGRectMake(0, 0, WIDTH, intervalY + (buttonHeight + intervalY)*2);
        self.frame = CGRectMake(0, 0, WIDTH, intervalY + (buttonHeight + intervalY)*2);
    }
    
    //pageControl
    self.squaredUpViewPageControl.numberOfPages = pages;
    self.squaredUpViewPageControl.bounds = CGRectMake(0, 0, WIDTH, 7);
    self.squaredUpViewPageControl.center = CGPointMake(WIDTH/2.0, CGRectGetHeight(self.frame)-7);
    self.squaredUpViewPageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    self.squaredUpViewPageControl.pageIndicatorTintColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    
    return self.frame;
}

#pragma mark -
#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.squaredUpViewPageControl.currentPage = self.squaredUpBGView.contentOffset.x/WIDTH;
}


#pragma mark -
#pragma mark - Seter && Geter
- (UIPageControl *)squaredUpViewPageControl {
    if (!_squaredUpViewPageControl) {
        _squaredUpViewPageControl = [UIPageControl new];
        _squaredUpViewPageControl.hidesForSinglePage = YES;
        [self addSubview:_squaredUpViewPageControl];
    }
    return _squaredUpViewPageControl;
}

- (NSArray *)squaredUpViewCellArray {
    if (!_squaredUpViewCellArray) {
        NSMutableArray *buttonsArray = [NSMutableArray array];
        for (int i = 0; i < self.classesArray.count; i ++) {
            CustomButton *button = [CustomButton buttonWithType:UIButtonTypeCustom];
            [self.squaredUpBGView addSubview:button];
            [buttonsArray addObject:button];
        }
        _squaredUpViewCellArray = [NSArray arrayWithArray:buttonsArray];
    }
    return _squaredUpViewCellArray;
}

- (UIScrollView *)squaredUpBGView {
    if (!_squaredUpBGView) {
        _squaredUpBGView = [[UIScrollView alloc] init];
        [self addSubview:_squaredUpBGView];
        _squaredUpBGView.delegate = self;
        _squaredUpBGView.showsHorizontalScrollIndicator = NO;
        _squaredUpBGView.pagingEnabled = YES;
    }
    return _squaredUpBGView;
}

@end






