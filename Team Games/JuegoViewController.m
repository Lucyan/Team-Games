//
//  JuegoViewController.m
//  Team Games
//
//  Created by Leonardo on 13-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import "JuegoViewController.h"
#import "PreguntasClass.h"

@interface JuegoViewController ()

@end

@implementation JuegoViewController

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
    
    //[self.vistaPrueba setFrame:CGRectMake(512, 0, 0, self.vista.frame.size.height)];
    
}

-(void)viewDidAppear:(BOOL)animated {
    [self iniciar];
}

- (void) iniciar {
    
    NSArray *newsPos = [[NSArray alloc] initWithObjects:[[NSDictionary alloc] initWithObjectsAndKeys:@"139", @"posx", @"113", @"posy", nil],
                        [[NSDictionary alloc] initWithObjectsAndKeys:@"437", @"posx", @"113", @"posy", nil],
                        [[NSDictionary alloc] initWithObjectsAndKeys:@"737", @"posx", @"113", @"posy", nil],
                        [[NSDictionary alloc] initWithObjectsAndKeys:@"139", @"posx", @"397", @"posy", nil],
                        [[NSDictionary alloc] initWithObjectsAndKeys:@"437", @"posx", @"397", @"posy", nil],
                        [[NSDictionary alloc] initWithObjectsAndKeys:@"737", @"posx", @"397", @"posy", nil],
                        nil];
    
    for (int i=0; i < [self.imgNaipe count]; i++) {
        UITapGestureRecognizer *tapNaipe = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seleccionar:)];
        [tapNaipe setNumberOfTapsRequired:1];
        [tapNaipe setNumberOfTouchesRequired:1];
        [tapNaipe setDelegate:self];
        
        UIImageView *imagen = (UIImageView *) [self.imgNaipe objectAtIndex:i];
        imagen.userInteractionEnabled = YES;
        [imagen addGestureRecognizer:tapNaipe];
        
        [UIView animateWithDuration:0.5 delay:(i*0.1) options:UIViewAnimationOptionAllowAnimatedContent animations:^{
            [imagen setFrame:CGRectMake([[[newsPos objectAtIndex:i] objectForKey:@"posx"] intValue], [[[newsPos objectAtIndex:i] objectForKey:@"posy"] intValue], imagen.frame.size.width, imagen.frame.size.height)];
        }completion:nil];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) seleccionar:(UIGestureRecognizer *) gestureRecognizer {
    for (int i=0; i < [self.imgNaipe count]; i++) {
        UIImageView *imagen = (UIImageView *) [self.imgNaipe objectAtIndex:i];
        imagen.userInteractionEnabled = NO;
    }
    
    int numPrueba = arc4random() % 6;
    PreguntasClass *preguntas = [PreguntasClass getInstance];
    
    self.tituloText.text = [[[[preguntas.datos objectForKey:preguntas.horario] objectForKey:preguntas.genero] objectAtIndex:numPrueba] objectForKey:@"titulo"];
    self.descripcionText.text = [[[[preguntas.datos objectForKey:preguntas.horario] objectForKey:preguntas.genero] objectAtIndex:numPrueba] objectForKey:@"descripcion"];
    
    
    UIImageView *imagen = (UIImageView *) [gestureRecognizer view];
    UIImage *imgPrueba = [UIImage imageNamed:@"prueba.jpg"];
    
    [UIView transitionWithView:imagen duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        [imagen setImage:imgPrueba];
    }completion:^(BOOL finish) {
        if (finish) {
            [self performSelector:@selector(muestraPrueba:) withObject:imagen afterDelay:0.5];
        }
    }];
    
}

-(void) muestraPrueba:(UIImageView *) imagen {
    [UIView transitionFromView:imagen toView:self.vistaPrueba duration:1.0 options:UIViewAnimationOptionTransitionCurlUp completion:nil];
}
- (IBAction)btnCerrar:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
