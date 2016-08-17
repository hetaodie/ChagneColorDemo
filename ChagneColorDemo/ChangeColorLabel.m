//
//  ChangeColorLabel.m
//  ChagneColorDemo
//
//  Created by Weixu on 16/6/3.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import "ChangeColorLabel.h"



@interface ChangeColorLabel()
@property(nonatomic, retain) UILabel *label;
@property(nonatomic, retain) CAGradientLayer *gradientLayer;



@end

@implementation ChangeColorLabel



- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUpLabel];
        return self;
    }
    return nil;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
          [self addChangeColor];
        [self setUpLabel];
    }
    return self;
}

- (void)setFont:(UIFont *)font{
    self.label.font = font;
}

- (void)setUpLabel{
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    _label = [[UILabel alloc] init];
        [self.label setFrame:self.bounds];
    
    [self.label setBackgroundColor:[UIColor redColor]];
    [self.label setText:@"测试用例，欢迎使用"];

    
    [self addSubview:self.label];
    [self addLabelAutoLayout];
    
}

- (void)addLabelAutoLayout{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.label
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.label
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeading
                                                    multiplier:1
                                                      constant:0]];
    
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.label
//                                                     attribute:NSLayoutAttributeTrailing
//                                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
//                                                        toItem:self
//                                                     attribute:NSLayoutAttributeTrailing
//                                                    multiplier:1
//                                                      constant:0]];
//    
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.label
//                                                     attribute:NSLayoutAttributeBottom
//                                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
//                                                        toItem:self
//                                                     attribute:NSLayoutAttributeBottom
//                                                    multiplier:1
//                                                      constant:0]];
//    
}

- (void)awakeFromNib{
    [self addChangeColor];
}

-  (void)addChangeColor{
    //1.创建一个颜色渐变层，渐变图层跟文字控件一样大。
    _gradientLayer = [CAGradientLayer layer];
    

    self.gradientLayer.startPoint = CGPointMake(0.0,1.0);
    self.gradientLayer.endPoint = CGPointMake(1.0, 1.0);
    
    //2. 设置渐变层的颜色，随机颜色渐变
    self.gradientLayer.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor whiteColor].CGColor,(id)[UIColor blueColor].CGColor];
    
    //3. 添加渐变层到控制器的view图层上
    [self.layer addSublayer:self.gradientLayer];
    

}

- (void)drawRect:(CGRect)rect{

}

- (void)layoutSubviews{
    [super layoutSubviews];
//    [self addChangeColor];
    _gradientLayer.frame = self.label.frame;
    _gradientLayer.mask = self.label.layer;
//    self.label.frame = _gradientLayer.bounds;
}

-(void)textChangeColors:(NSArray *)aColorArray {
    _gradientLayer.colors = aColorArray;
}


@end
