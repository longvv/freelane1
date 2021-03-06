//
//  SettingView.m
//  svcamcloud-mobile
//
//  Created by vu van long on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "SettingView.h"
#import "UIView+Extend.h"
#import "UserDataManager.h"

@implementation SettingView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"SettingView" owner:self options:nil];
        self = [subviewArray objectAtIndex:0];
        self.frame = frame;
        [self prepareLayout];
        [self loadSettingData];
    }
    return self;
}
- (void) loadSettingData{
    [self.txtDomain setText:[UserDataManager serverBaseUrl]];
    [self.txtPort setText:[UserDataManager serverPort]];
}
- (void)prepareLayout{
    [self.txtDomain setupViewBorder];
    [self.txtPort setupViewBorder];
    [self.btnRemember setupViewBorder];
}

- (IBAction)btnRememberPressed:(id)sender {
    //  NSString *//
    if (!self.isChecked) {
        [self.btnRemember setImage:[UIImage imageNamed:@"ic_check"] forState:UIControlStateNormal];
        self.isChecked = YES;
    }else{
        [self.btnRemember setImage:nil forState:UIControlStateNormal];
        self.isChecked = NO;
    }

    if(self.isChecked){
        [self.txtPort setText:@"443"];
    }else{
        [self.txtPort setText:@"80"];
    }
    
}

- (IBAction)btnSavePressed:(id)sender {
    NSString *serverUrl = self.txtDomain.text;
    NSString *port = self.txtPort.text;
    [UserDataManager saveServerBaseUrl:serverUrl];
    [UserDataManager saveServerPort:port];

}

@end
