//
//  LoginView.m
//  svcamcloud-mobile
//
//  Created by vu van long on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "LoginView.h"
#import "UIView+Extend.h"

@implementation LoginView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:self options:nil];
        self = [subviewArray objectAtIndex:0];
        self.frame = frame;
        [self prepareLayout];
    }
    return self;
}

- (void)prepareLayout{
    [self.txtPassword setupViewBorder];
    [self.txtEmail setupViewBorder];
    [self.btnRemember setupViewBorder];
}

#pragma mark - TextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField becomeFirstResponder];
    if ([textField isEqual:self.txtEmail]) {
        [self.txtPassword resignFirstResponder];
    }else{
        [self btnSinginPressed:nil];
    }
    return YES;
}

#pragma mark - IBAction methods
- (IBAction)btnSinginPressed:(id)sender {
    NSString *email = self.txtEmail.text;
    NSString *password = self.txtPassword.text;
    if ([self.delegate respondsToSelector:@selector(loginUser:password:)]) {
        [self.delegate loginUser:email password:password];
    }
}

@end
