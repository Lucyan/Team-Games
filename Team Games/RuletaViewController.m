//
//  RuletaViewController.m
//  Team Games
//
//  Created by Leonardo on 15-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import "RuletaViewController.h"
#import "PreguntasClass.h"
#import "VistaPruebaViewController.h"

@interface RuletaViewController () {
    int numPrueba;
    int numTorno1;
    int numTorno2;
    int numTorno3;
    NSArray *pruebas;
}

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
    
    [self iniciaSonido];
    
    PreguntasClass *pruebasDatos = [PreguntasClass getInstance];
    pruebas = (NSArray *) [[pruebasDatos.datos objectForKey:pruebasDatos.horario] objectForKey:pruebasDatos.genero];
    
    numPrueba = arc4random() % [pruebas count];
    numTorno1 = arc4random() % [pruebas count];
    numTorno2 = arc4random() % [pruebas count];
    numTorno3 = arc4random() % [pruebas count];
    
    for (UIImageView *imagen in self.imgColumna1) {
        [imagen setImage:[UIImage imageNamed:[[pruebas objectAtIndex:numTorno1] objectForKey:@"imagen"]]];
        numTorno1++;
        if (numTorno1 == [pruebas count]) {
            numTorno1 = 0;
        }
    }
    
    for (UIImageView *imagen in self.imgColumna2) {
        [imagen setImage:[UIImage imageNamed:[[pruebas objectAtIndex:numTorno2] objectForKey:@"imagen"]]];
        numTorno2++;
        if (numTorno2 == [pruebas count]) {
            numTorno2 = 0;
        }
    }
    
    for (UIImageView *imagen in self.imgColumna3) {
        [imagen setImage:[UIImage imageNamed:[[pruebas objectAtIndex:numTorno3] objectForKey:@"imagen"]]];
        numTorno3++;
        if (numTorno3 == [pruebas count]) {
            numTorno3 = 0;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)moverRuleta:(NSArray *) coleccionImagenes conVueltas:(int) vueltas iniciarEn:(int) iniTorno numeroDeTorno:(int) numeroTorno conSonido:(AVAudioPlayer *) finTorno {
    [UIView animateWithDuration:0.11 animations:^{
        for (UIImageView *imagen in coleccionImagenes) {
            [imagen setFrame:CGRectMake(imagen.frame.origin.x, imagen.frame.origin.y+200, imagen.frame.size.width, imagen.frame.size.height)];
        }
    }completion:^(BOOL finish) {
        if (finish) {
            int numTorno = iniTorno;
            
            for (UIImageView *imagen in coleccionImagenes) {
                if (imagen.frame.origin.y == 684) {
                    [imagen setFrame:CGRectMake(imagen.frame.origin.x, 84, imagen.frame.size.width, imagen.frame.size.height)];
                    
                    if (vueltas == 1) {
                        [imagen setImage:[UIImage imageNamed:[[pruebas objectAtIndex:numPrueba] objectForKey:@"imagen"]]];
                    } else {
                        [imagen setImage:[UIImage imageNamed:[[pruebas objectAtIndex:numTorno] objectForKey:@"imagen"]]];
                    }
                    
                    numTorno++;
                    if (numTorno == [pruebas count]) {
                        numTorno = 0;
                    }
                }
            }
            
            if (vueltas > 0) {
                [self moverRuleta:coleccionImagenes conVueltas:vueltas-1 iniciarEn:numTorno numeroDeTorno:numeroTorno conSonido:finTorno];
                if (vueltas == 1) {
                    [finTorno play];
                }
            } else if (numeroTorno == 3) {
                [sonidoTorno stop];
                [self performSelector:@selector(muestraPrueba) withObject:nil afterDelay:1.0];
            }
        }
    }];
}

- (void)muestraPrueba {
    VistaPruebaViewController *vistaPrueba = [self.storyboard instantiateViewControllerWithIdentifier:@"pruebaID"];
    
    vistaPrueba.prueba = (NSDictionary *) [pruebas objectAtIndex:numPrueba];
    
    [self.navigationController pushViewController:vistaPrueba animated:YES];
    
}

- (void)torno2 {
    [self moverRuleta:self.imgColumna2 conVueltas:20 iniciarEn:numTorno2 numeroDeTorno:2 conSonido:sonidoFinTorno2];
}

- (void)torno3 {
    [self moverRuleta:self.imgColumna3 conVueltas:20 iniciarEn:numTorno3 numeroDeTorno:3 conSonido:sonidoFinTorno];
}

- (IBAction)btnIniciar:(id)sender {
    //[sonidoBoton play];
    UIButton *boton = (UIButton *) sender;
    [boton setEnabled:NO];
    
    [sonidoTorno play];
    [self moverRuleta:self.imgColumna1 conVueltas:20 iniciarEn:numTorno1 numeroDeTorno:1 conSonido:sonidoFinTorno];
    [self performSelector:@selector(torno2) withObject:nil afterDelay:0.4];
    [self performSelector:@selector(torno3) withObject:nil afterDelay:0.8];
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
    
    
    // Inicia Sonido Torno
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                  pathForResource:@"torno"
                                  ofType:@"m4a"]];
    
    sonidoTorno = [[AVAudioPlayer alloc]
                    initWithContentsOfURL:url
                    error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        sonidoTorno.delegate = self;
        sonidoTorno.volume = 0.2;
        sonidoTorno.numberOfLoops = -1;
        [sonidoTorno prepareToPlay];
    }
    
    // Inicia Sonido Fin Torno
    url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                  pathForResource:@"tornofinal"
                                  ofType:@"m4a"]];
    
    sonidoFinTorno = [[AVAudioPlayer alloc]
                   initWithContentsOfURL:url
                   error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        sonidoFinTorno.delegate = self;
        [sonidoFinTorno prepareToPlay];
    }
    
    sonidoFinTorno2 = [[AVAudioPlayer alloc]
                      initWithContentsOfURL:url
                      error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        sonidoFinTorno2.delegate = self;
        [sonidoFinTorno2 prepareToPlay];
    }
}

// Fix Landscape mode en iOS 5
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
    
}

@end
