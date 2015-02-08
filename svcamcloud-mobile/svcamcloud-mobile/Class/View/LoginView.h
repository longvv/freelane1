//
//  LoginView.h
//  svcamcloud-mobile
//
//  Created by vu van long on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginDelegate

- (void)loginUser:(NSString*)email password:(NSString*)pass;

@end

@interface LoginView : UIView<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnRemember;
@property (weak, nonatomic) IBOutlet UIButton *btnSignin;
@property (assign, nonatomic) id delegate;

- (IBAction)btnSinginPressed:(id)sender;
@end
