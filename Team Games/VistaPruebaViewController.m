//
//  VistaPruebaViewController.m
//  Team Games
//
//  Created by Leonardo on 16-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import "VistaPruebaViewController.h"
#import "PreguntasClass.h"
#import "HazteFanViewController.h"

@interface VistaPruebaViewController ()

@end

@implementation VistaPruebaViewController

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
    
    [self iniciaBotonSonido];
    [self cargarDatos];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) cargarDatos {
    [self.txtTitulo setFont:[UIFont fontWithName:@"QType Pro" size:45.0]];
    [self.txtSubtitulo setFont:[UIFont fontWithName:@"QType Pro" size:27.0]];
    [self.txtDescripcion setFont:[UIFont fontWithName:@"QType Pro" size:25.0]];
    
    [self.txtSubtitulo setTextColor:[UIColor colorWithRed:0.812 green:0.706 blue:0.286 alpha:1]];
    
    [self.imgPrueba setImage:[UIImage imageNamed:[self.prueba objectForKey:@"imagen"]]];
    [self.txtTitulo setText:[self.prueba objectForKey:@"titulo"]];
    [self.txtSubtitulo setText:[self.prueba objectForKey:@"subtitulo"]];
    [self.txtDescripcion setText:[self.prueba objectForKey:@"descripcion"]];
    //[self.txtDescripcion sizeToFit];
}

- (IBAction)btnCerrar:(id)sender {
    [sonidoBoton play];
    HazteFanViewController *fan = [self.storyboard instantiateViewControllerWithIdentifier:@"fanID"];
    
    [self.navigationController pushViewController:fan animated:YES];
}



- (void)iniciaBotonSonido {
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"click"
                                         ofType:@"m4a"]];
    
    NSError *error;
    sonidoBoton = [[AVAudioPlayer alloc]
                   initWithContentsOfURL:url
                   error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        sonidoBoton.delegate = self;
        sonidoBoton.volume = 0.3;
        [sonidoBoton prepareToPlay];
    }
}

// Fix Landscape mode en iOS 5
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
    
}

@end
