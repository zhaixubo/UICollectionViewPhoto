//
//  MainView.m
//  UICollectionView照片墙
//
//  Created by 翟旭博 on 2022/12/29.
//

#import "MainView.h"
#import "MyCollectionViewCell.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface MainView () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGestureRecognizer;
@property (nonatomic, assign) int numberOfItem;
@end
@implementation MainView

- (void)viewInit {
    self.backgroundColor = [UIColor whiteColor];
    _numberOfItem = 30;
    //layout布局类
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //布局方向为垂直流布局
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    layout.itemSize = CGSizeMake(SIZE_WIDTH / 3 - 20, SIZE_WIDTH / 3 - 20);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor yellowColor];
    [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self addSubview:_collectionView];
    
    self.longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] init];
    self.longPressGestureRecognizer.minimumPressDuration = 0.5;
    [self.longPressGestureRecognizer addTarget:self action:@selector(handleLongPressRecognizer:)];
    [self.collectionView addGestureRecognizer:self.longPressGestureRecognizer];

}

- (void)handleLongPressRecognizer:(UILongPressGestureRecognizer *)gesture{
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:{
            NSIndexPath *path = [self.collectionView indexPathForItemAtPoint:[gesture locationInView:gesture.view]];
            if(path == nil){
                break;
            }
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:path];
        }
            break;
        case UIGestureRecognizerStateChanged:
            [self.collectionView updateInteractiveMovementTargetPosition:[gesture locationInView:gesture.view]];
            break;
        case UIGestureRecognizerStateEnded:
            [self.collectionView endInteractiveMovement];
            break;
        default:
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}

//返回分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//返回每个分区的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _numberOfItem;
}
//返回每个item
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", indexPath.row % 4 + 1]] and:indexPath.item];
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld", indexPath.item);
    if (indexPath.item == 0) {
        if (_numberOfItem == 1) {
            _numberOfItem = 30;
        } else {
            _numberOfItem = 1;
        }
        [self.collectionView reloadData];
    }
}
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
 
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath{
    NSLog(@"666");
}

//间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(15, 15, 15, 15);
    
}

@end
