//
//  MarkItemCell.m
//  MarkChoseView
//
//  Created by 龙青磊 on 2017/11/17.
//  Copyright © 2017年 龙青磊. All rights reserved.
//

#import "MarkItemCell.h"
#import "config.h"

@interface MarkItemCell()

@property (nonatomic,strong) UILabel *label;

@end

@implementation MarkItemCell

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.layer.borderColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0].CGColor;
        self.layer.borderWidth = 0.2;
        self.layer.cornerRadius = frame.size.height/2;
        self.label = [[UILabel alloc] initWithFrame:self.bounds];
        self.label.font = kCellLabelFont;
        self.label.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = [UIColor whiteColor];
        self.label.textColor = [UIColor colorWithRed:99/255.0 green:99/255.0 blue:99/255.0 alpha:1.0];
        [self.contentView addSubview:self.label];
    }
    return self;
}


- (void)setContent:(NSString *)aContent
{
    self.label.frame = self.bounds;
    self.label.text = aContent;
}

@end
