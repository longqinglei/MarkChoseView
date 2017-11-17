//
//  QL_CustomFlowLayout.h
//  MarkChoseView
//
//  Created by 龙青磊 on 2017/11/17.
//  Copyright © 2017年 龙青磊. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,AlignType){
    AlignWithLeft,
    AlignWithCenter,
    AlignWithRight
};

@interface ItemData : NSObject

@property (nonatomic,copy) NSString *content;   //内容

@property (nonatomic,assign) CGSize size;       //大小

@end

@interface QL_CustomFlowLayout : UICollectionViewFlowLayout

//两个Cell之间的距离
@property (nonatomic,assign)CGFloat betweenOfCell;
//cell对齐方式
@property (nonatomic,assign)AlignType cellType;

-(instancetype)initWthType : (AlignType)cellType;
//全能初始化方法 其他方式初始化最终都会走到这里
-(instancetype)initWithType:(AlignType) cellType betweenOfCell:(CGFloat)betweenOfCell;


@end
