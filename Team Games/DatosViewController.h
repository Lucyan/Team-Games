//
//  DatosViewController.h
//  Tem Games
//
//  Created by Leonardo on 13-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface DatosViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nombreText;
@property (weak, nonatomic) IBOutlet UITextField *emailText;

- (IBAction)btnSeguir:(id)sender;
- (IBAction)btnVolver:(id)sender;

@end
