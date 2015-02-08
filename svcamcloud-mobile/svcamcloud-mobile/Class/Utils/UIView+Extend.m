//
//  UIView+Extend.m
//  svcamcloud-mobile
//
//  Created by vu van long on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "UIView+Extend.h"

@implementation UIView (Extend)
- (void)setupViewBorder{
    self.layer.borderColor = [[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0] CGColor];
    self.layer.borderWidth = 0.5;
    self.layer.cornerRadius = 5;
}
@end
