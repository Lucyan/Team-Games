//
//  RuletaViewController.h
//  Team Games
//
//  Created by Leonardo on 15-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RuletaViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgColumna1;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgColumna2;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgColumna3;
- (IBAction)btnIniciar:(id)sender;

@end
