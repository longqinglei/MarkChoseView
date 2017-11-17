//
//  ViewController.m
//  MarkChoseView
//
//  Created by 龙青磊 on 2017/11/17.
//  Copyright © 2017年 龙青磊. All rights reserved.
//

#import "ViewController.h"
#import "MarkChoseVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)beginChoseLeft:(UIButton *)sender {
    MarkChoseVC *markVC = [[MarkChoseVC alloc]init];
    markVC.type = AlignWithLeft;
    [self.navigationController pushViewController:markVC animated:YES];
}


- (IBAction)beginChose:(UIButton *)sender {
    MarkChoseVC *markVC = [[MarkChoseVC alloc]init];
    markVC.type = AlignWithCenter;
    [self.navigationController pushViewController:markVC animated:YES];
}
- (IBAction)beginChoseRight:(UIButton *)sender {
    MarkChoseVC *markVC = [[MarkChoseVC alloc]init];
    markVC.type = AlignWithRight;
    [self.navigationController pushViewController:markVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
