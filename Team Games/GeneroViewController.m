//
//  GeneroViewController.m
//  Tem Games
//
//  Created by Leonardo on 13-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import "GeneroViewController.h"
#import "PreguntasClass.h"
#import "HazteFanViewController.h"

@interface GeneroViewController () {
    MPMoviePlayerController *moviePlayer;
    UIImageView *fondoView;
}

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
    
    [self iniciaBotonSonido];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnHombre:(id)sender {
    [sonidoBoton play];
    [self siguiente:@"hombre"];
}

- (IBAction)btnMujer:(id)sender {
    [sonidoBoton play];
    [self siguiente:@"mujer"];
}

- (IBAction)btnVolver:(id)sender {
    [sonidoBoton play];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) siguiente:(NSString *) genero {
    PreguntasClass *preguntas = [PreguntasClass getInstance];
    preguntas.genero = genero;
    
    UINavigationController *datos = [self.storyboard instantiateViewControllerWithIdentifier:@"juegoNCID"];
    
    [self presentViewController:datos animated:YES completion:nil];
}

- (IBAction)btnVideo:(id)sender {
    [self video];
}

- (IBAction)btnHazteFan:(id)sender {
    [sonidoBoton play];
    
    HazteFanViewController *hazteFan = [self.storyboard instantiateViewControllerWithIdentifier:@"fanID"];
    
    [hazteFan setVista:@"inicio"];
    
    [self presentViewController:hazteFan animated:YES completion:nil];
}

-(void)video {
	
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *moviePath = [bundle pathForResource:@"video" ofType:@"m4v"];
                           
    NSURL *movieURL;
    
    if (moviePath) {
        movieURL = [NSURL fileURLWithPath:moviePath];
    }
    if (movieURL != nil) {
        moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
        
        [moviePlayer setRepeatMode:MPMovieRepeatModeOne];
        [moviePlayer setControlStyle:MPMovieControlStyleNone];
        
        UIButton *botonStop = [[UIButton alloc] initWithFrame:[[self view] bounds]];
        [botonStop addTarget:self action:@selector(stopVideo) forControlEvents:UIControlEventTouchUpInside];
        
        UIImage *fondo = [UIImage imageNamed:@"fondoVideo.png"];
        fondoView = [[UIImageView alloc] initWithFrame:[[self view] bounds]];
        [fondoView setImage:fondo];
        
        [[moviePlayer view] setFrame:[[self view] bounds]];
        [[moviePlayer view] addSubview:fondoView];
        [[moviePlayer view] addSubview:botonStop];
        
        [moviePlayer play];
        
        [UIView transitionFromView:self.view toView:moviePlayer.view duration:0.4 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finish){
            if (finish) {
                [fondoView removeFromSuperview];
            }
        }];
        
        
    }
}

- (void)stopVideo {
    [UIView transitionFromView:moviePlayer.view toView:self.view duration:0.4 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finish){
        if (finish) {
            [moviePlayer stop];
        }
    }];
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
