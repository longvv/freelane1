//
//  SettingView.m
//  svcamcloud-mobile
//
//  Created by vu van long on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "SettingView.h"
#import "UIView+Extend.h"

@implementation SettingView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"SettingView" owner:self options:nil];
        self = [subviewArray objectAtIndex:0];
        self.frame = frame;
        [self prepareLayout];
    }
    return self;
}

- (void)prepareLayout{
    [self.txtDomain setupViewBorder];
    [self.txtPort setupViewBorder];
    [self.btnRemember setupViewBorder];
}

- (IBAction)btnRememberPressed:(id)sender {
    if (!self.isChecked) {
        [self.btnRemember setImage:[UIImage imageNamed:@"ic_check"] forState:UIControlStateNormal];
        self.isChecked = YES;
    }else{
        [self.btnRemember setImage:nil forState:UIControlStateNormal];
        self.isChecked = NO;
    }
}

- (IBAction)btnSavePressed:(id)sender {
}

@end
