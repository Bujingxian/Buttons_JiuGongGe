//
//  ViewController.m
//  Buttons_JiuGongGe
//
//  Created by 😸 on 16/3/3.
//  Copyright © 2016年 😸. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"
#import "SquaredUpView.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *arrm_BigClass;/**< 九宫格数组 */
@property (nonatomic, strong) NSArray *arrm_TesstArr1;
@property (nonatomic, strong) NSArray *arrm_TesstArr2;
@property (nonatomic, strong) NSArray *arrm_TesstArr3;
@property (nonatomic, strong) NSArray *arrm_TesstArr4;

@end

@implementation ViewController

#pragma mark -
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _arrm_TesstArr1 = @[@"销量排名",@"新品上市",@"销量排名",@"新品上市",@"销量排名",@"新品上市",@"销量排名",@"新品上市",@"销量排名",@"新品上市",@"销量排名",@"新品上市",@"销量排名",@"新品上市",@"销量排名",@"新品上市",@"销量排名",@"新品上市",@"销量排名",@"新品上市",@"销量排名",@"新品上市",@"销量排名",@"新品上市",@"销量排名",@"新品上市",@"销量排名",@"新品上市"];
    _arrm_TesstArr2 = @[@"按钮3",@"按钮2",@"按钮3",@"按钮2",@"按钮3",@"按钮2",@"按钮3",@"按钮2",@"按钮3",@"按钮2"];
    _arrm_TesstArr3 = @[@"按钮3",@"按钮2",@"按钮3",@"按钮2"];
    _arrm_TesstArr4 = @[@"按钮3",@"按钮2"];
    
    [self initSquaredUpView];
}

- (void)initSquaredUpView {
    SquaredUpView *squaredUpView = [[SquaredUpView alloc] init];
    [self.view addSubview:squaredUpView];
    CGRect squaredeUpViewFrame = [squaredUpView layoutSquaredUpViewCellsFrameWithModelArray:_arrm_TesstArr1];
    squaredUpView.frame = CGRectMake(0, 64, CGRectGetWidth(squaredeUpViewFrame), CGRectGetHeight(squaredeUpViewFrame));
    [squaredUpView.squaredUpViewCellArray enumerateObjectsUsingBlock:^(CustomButton *button, NSUInteger idx, BOOL * _Nonnull stop) {
        [button setTitle:_arrm_TesstArr1[idx] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:_arrm_TesstArr1[idx]] forState:UIControlStateNormal];
    }];
    
}



@end
