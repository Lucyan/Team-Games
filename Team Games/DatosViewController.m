//
//  DatosViewController.m
//  Tem Games
//
//  Created by Leonardo on 13-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import "DatosViewController.h"
#import "Personas.h"
#import "RuletaViewController.h"

@interface DatosViewController ()

@end

@implementation DatosViewController

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

- (IBAction)btnSeguir:(id)sender {
    if (![self.nombreText.text isEqualToString:@""] && ![self.emailText.text isEqualToString:@""]) {
        [self insertarDatos];
        
        RuletaViewController *juego = [self.storyboard instantiateViewControllerWithIdentifier:@"ruletaID"];
        
        [self.navigationController pushViewController:juego animated:YES];
    } else {
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"ERROR"
                                                         message:@"Ingresa los datos indicados"
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles: nil];
        
        [alerta show];
    }
}

- (IBAction)btnVolver:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void) insertarDatos {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    Personas *persona = [NSEntityDescription insertNewObjectForEntityForName:@"Personas" inManagedObjectContext:context];
    
    persona.nombre = self.nombreText.text;
    persona.email = self.emailText.text;
    
    NSError *error;
    
    if (![context save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
}
@end
