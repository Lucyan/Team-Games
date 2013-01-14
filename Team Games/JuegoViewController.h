//
//  JuegoViewController.h
//  Team Games
//
//  Created by Leonardo on 13-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JuegoViewController : UIViewController <UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgNaipe;
@property (strong, nonatomic) IBOutlet UIView *vista;
@property (weak, nonatomic) IBOutlet UIView *vistaPrueba;
@property (weak, nonatomic) IBOutlet UILabel *tituloText;
@property (weak, nonatomic) IBOutlet UILabel *descripcionText;

- (IBAction)btnCerrar:(id)sender;

@end
