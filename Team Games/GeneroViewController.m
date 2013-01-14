//
//  GeneroViewController.m
//  Tem Games
//
//  Created by Leonardo on 13-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import "GeneroViewController.h"
#import "PreguntasClass.h"

@interface GeneroViewController ()

@end

@implementation GeneroViewController

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

- (IBAction)btnHombre:(id)sender {
    [self siguiente:@"hombre"];
}

- (IBAction)btnMujer:(id)sender {
    [self siguiente:@"mujer"];
}

- (IBAction)btnVolver:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) siguiente:(NSString *) genero {
    PreguntasClass *preguntas = [PreguntasClass getInstance];
    preguntas.genero = genero;
    
    UINavigationController *datos = [self.storyboard instantiateViewControllerWithIdentifier:@"juegoNCID"];
    
    [self presentViewController:datos animated:YES completion:nil];
}

@end
