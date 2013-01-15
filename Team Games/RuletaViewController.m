//
//  RuletaViewController.m
//  Team Games
//
//  Created by Leonardo on 15-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import "RuletaViewController.h"

@interface RuletaViewController ()

@end

@implementation RuletaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)moverRuleta:(NSArray *) coleccionImagenes conVueltas:(int) vueltas {
    [UIView animateWithDuration:0.11 animations:^{
        for (UIImageView *imagen in coleccionImagenes) {
            [imagen setFrame:CGRectMake(imagen.frame.origin.x, imagen.frame.origin.y+200, imagen.frame.size.width, imagen.frame.size.height)];
        }
    }completion:^(BOOL finish) {
        if (finish) {
            for (UIImageView *imagen in coleccionImagenes) {
                if (imagen.frame.origin.y == 674) {
                    [imagen setFrame:CGRectMake(imagen.frame.origin.x, 74, imagen.frame.size.width, imagen.frame.size.height)];
                }
            }
            
            if (vueltas > 0) {
                [self moverRuleta:coleccionImagenes conVueltas:vueltas-1];
            }
        }
    }];
}

- (void)torno2 {
    [self moverRuleta:self.imgColumna2 conVueltas:20];
}

- (void)torno3 {
    [self moverRuleta:self.imgColumna3 conVueltas:20];
}

- (IBAction)btnIniciar:(id)sender {
    [self moverRuleta:self.imgColumna1 conVueltas:20];
    [self performSelector:@selector(torno2) withObject:nil afterDelay:0.4];
    [self performSelector:@selector(torno3) withObject:nil afterDelay:0.8];
}
@end
