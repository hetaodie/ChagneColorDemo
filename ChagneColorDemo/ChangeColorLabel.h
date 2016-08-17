//
//  ChangeColorLabel.h
//  ChagneColorDemo
//
//  Created by Weixu on 16/6/3.
//  Copyright © 2016年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeColorLabel : UIView

@property (nonatomic,retain) UIFont *font;
-(void)textChangeColors:(NSArray *)aColorArray;
@end
