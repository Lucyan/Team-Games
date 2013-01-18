//
//  HazteFanViewController.m
//  Team Games
//
//  Created by Leonardo on 16-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import "HazteFanViewController.h"

@interface HazteFanViewController ()

@end

@implementation HazteFanViewController

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
    
    [self iniciaSonido];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
- (IBAction)btnCerrar:(id)sender {
    [sonidoBoton play];
    if ([self.vista isEqualToString:@"inicio"]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}


- (void)iniciaSonido {
    
    // Inicia Sonido Boton
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
