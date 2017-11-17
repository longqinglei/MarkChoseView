//
//  MarkChoseVC.m
//  MarkChoseView
//
//  Created by 龙青磊 on 2017/11/17.
//  Copyright © 2017年 龙青磊. All rights reserved.
//

#import "MarkChoseVC.h"
#import "MarkItemCell.h"
#import "QL_CustomFlowLayout.h"


@interface MarkChoseVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonnull, strong) NSMutableArray *choseArray;

@end

@implementation MarkChoseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"选择兴趣爱好";
    [self loadData];
    [self initSubViews];
}

- (void)loadData{
    NSArray *arr = @[@"没声",@"音乐剧",@"交响乐",@"R&B",@"乡村风格的音乐",@"轻音乐",@"民谣",@"蓝调音乐",@"hiphop",@"乐器",@"摇滚",@"音乐治疗",@"艺术管理",@"编曲",@"艺考",@"中西方音乐史",@"爵士",@"其大方法是的是的发生"];
    self.choseArray = [NSMutableArray array];
    self.dataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < arr.count; i++) {
        ItemData *itemData = [[ItemData alloc] init];
        itemData.content = arr[i];
        CGSize size = [arr[i] sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kCellLabelFont,NSFontAttributeName,nil]];
        itemData.size = CGSizeMake(size.width + kCellEmptyWidth,kItemHegith);
        [self.dataArray addObject:itemData];
    }
}

- (void)initSubViews{
    QL_CustomFlowLayout * flowLayout = [[QL_CustomFlowLayout alloc]initWithType:self.type betweenOfCell:5.0];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor colorWithRed:237/255.0 green:236/255.0 blue:234/255.0 alpha:1];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerIdentifier"];
    [self.collectionView registerClass:[MarkItemCell class] forCellWithReuseIdentifier:@"CellIdentifier"];
    [self.collectionView setContentInset:UIEdgeInsetsMake(kHeaderEdgeHeight, 0, 0, 0)];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.collectionView.frame = self.view.frame;
        [self.collectionView reloadData];
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}


#pragma mark -- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *moreCellIdentifier = @"CellIdentifier";
    MarkItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:moreCellIdentifier forIndexPath:indexPath];
    ItemData *itemData = [self.dataArray objectAtIndex:[indexPath item]];
    cell.content = itemData.content;
    return cell;
}

#pragma mark 返回collectionview尾视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionFooter){
        UICollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerIdentifier" forIndexPath:indexPath];
        UIButton  *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(affirmAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(15 , 20, headerView.frame.size.width - 30, headerView.frame.size.height-20);
        btn.layer.cornerRadius = (headerView.frame.size.height - 20) / 2;
        btn.backgroundColor = [UIColor redColor];
        [headerView addSubview:btn];
        reusableview = headerView;
    }
    return reusableview;
}
#pragma mark  确认按钮的点击方法
- (void)affirmAction:(UIButton *)btn{
    NSLog(@"点击了确认按钮 选择了");
    for (NSString *indexrow in self.choseArray) {
        ItemData *data = self.dataArray[[indexrow integerValue]];
        NSLog(@"%@",data.content);
    }
}
#pragma mark  返回尾视图的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(collectionView.frame.size.width, kFooterHeight);
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemData *itemData = [self.dataArray objectAtIndex:[indexPath row]];
    return itemData.size;
}

#pragma mark  单元格点击的事件(标签点击的事件)
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MarkItemCell *cell = (MarkItemCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    if ([self.choseArray containsObject:[NSString stringWithFormat:@"%ld",indexPath.row]]) {
        cell.backgroundColor = kCellNormalColor;
        [self.choseArray removeObject:[NSString stringWithFormat:@"%ld",indexPath.row]];
    }else{
        cell.backgroundColor = kCellSelectColor;
        [self.choseArray addObject:[NSString stringWithFormat:@"%ld",indexPath.row]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
