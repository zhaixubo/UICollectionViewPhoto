//
//  ViewController.m
//  UICollectionView照片墙
//
//  Created by 翟旭博 on 2022/12/29.
//

#import "ViewController.h"
#import "MainView.h"
@interface ViewController ()
@property (nonatomic, strong) MainView *mainView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainView = [[MainView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.mainView];
    [self.mainView viewInit];
}


@end
