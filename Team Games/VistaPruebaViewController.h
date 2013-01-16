//
//  VistaPruebaViewController.h
//  Team Games
//
//  Created by Leonardo on 16-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VistaPruebaViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *txtTitulo;
@property (weak, nonatomic) IBOutlet UILabel *txtSubtitulo;
@property (weak, nonatomic) IBOutlet UILabel *txtDescripcion;
@property (weak, nonatomic) IBOutlet UIImageView *imgPrueba;

@property (nonatomic, retain) NSDictionary *prueba;
- (IBAction)btnCerrar:(id)sender;

@end
