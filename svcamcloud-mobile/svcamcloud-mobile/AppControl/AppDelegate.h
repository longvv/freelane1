//
//  AppDelegate.h
//  svcamcloud-mobile
//
//  Created by vu van long on 2/7/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

#define mainStoryboard [UIStoryboard storyboardWithName:@"Main" bundle:nil]
#define myCameraStoryboard [UIStoryboard storyboardWithName:@"MyCameraStoryboard" bundle:nil]
#define myRecordingStoryboard [UIStoryboard storyboardWithName:@"MyRecordingStoryboard" bundle:nil]

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

