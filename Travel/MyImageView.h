//
//  MyImageView.h
//  Travel
//
//  Created by qianfeng on 15/6/4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendModel.h"

@interface MyImageView : UIImageView
@property(nonatomic)RecommendModel * model;

-(id)initWithFrame:(CGRect)frame model:(RecommendModel *)model;

@end
