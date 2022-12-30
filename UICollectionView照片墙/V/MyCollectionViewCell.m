//
//  MyCollectionViewCell.m
//  UICollectionView照片墙
//
//  Created by 翟旭博 on 2022/12/29.
//

#import "MyCollectionViewCell.h"
@interface MyCollectionViewCell ()
@property (nonatomic, strong) UIImageView *mainImageView;
@property (nonatomic, strong) UIView *boundView;
@property (nonatomic, strong) UIButton *deleteButton;
@end
@implementation MyCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.boundView = [[UIView alloc] init];
    self.boundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.boundView];
    self.mainImageView = [[UIImageView alloc] init];
    [self.boundView addSubview:self.mainImageView];
    self.deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.deleteButton setImage:[[UIImage imageNamed:@"chacha2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [self.mainImageView addSubview:self.deleteButton];
    return self;
}
- (void)setImage:(UIImage *)image and:(NSInteger) buttonTag{
    if (!image) {
        return;
    }    
    CGFloat imgWidth = image.size.width;
    CGFloat imgHeight = image.size.height;
    CGFloat iconWidth = 0.0;
    CGFloat iconHeight = 0.0;
    
    if(imgWidth > imgHeight){
        iconHeight = roundf(((self.frame.size.width - 16)*imgHeight)/imgWidth);
        iconWidth = self.frame.size.width - 16;
        [self.boundView setFrame:CGRectMake(0, self.frame.size.height - iconHeight - 16, iconWidth + 16, iconHeight + 16)];
        [self.mainImageView setFrame:CGRectMake(8, 8, iconWidth, iconHeight)];
    }else{
        iconWidth = roundf(((self.frame.size.width - 16) *imgWidth)/imgHeight);
        iconHeight = self.frame.size.height - 16;
        [self.boundView setFrame:CGRectMake(roundf((self.frame.size.width - iconWidth)/2), 0, iconWidth + 16, iconHeight + 16)];
        [self.mainImageView setFrame:CGRectMake(8, 8, iconWidth, iconHeight)];
    }
    [self.deleteButton setFrame:CGRectMake(iconWidth - 20, 0, 20, 20)];
    self.deleteButton.hidden = YES;
    self.deleteButton.tag = buttonTag;
    [self.mainImageView setImage:image];
}
- (void)layoutSubviews {
    [super layoutSubviews];
}
@end
