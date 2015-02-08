//
//  SettingView.h
//  svcamcloud-mobile
//
//  Created by vu van long on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingView : UIView<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtDomain;
@property (weak, nonatomic) IBOutlet UITextField *txtPort;
@property (weak, nonatomic) IBOutlet UIButton *btnRemember;
@property (assign, nonatomic) id delegate;
@property (assign, nonatomic) BOOL isChecked;

- (IBAction)btnRememberPressed:(id)sender;
- (IBAction)btnSavePressed:(id)sender;
@end
