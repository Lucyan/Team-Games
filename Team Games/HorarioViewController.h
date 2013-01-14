//
//  HorarioViewController.h
//  Tem Games
//
//  Created by Leonardo on 13-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "AppDelegate.h"

@interface HorarioViewController : UIViewController <MFMailComposeViewControllerDelegate>
- (IBAction)btnDia:(id)sender;
- (IBAction)btnNoche:(id)sender;
- (IBAction)btnEnviar:(id)sender;

@end
