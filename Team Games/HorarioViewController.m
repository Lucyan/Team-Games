//
//  HorarioViewController.m
//  Tem Games
//
//  Created by Leonardo on 13-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import "HorarioViewController.h"
#import "PreguntasClass.h"
#import "GeneroViewController.h"
#import "Personas.h"

@interface HorarioViewController ()

@end

@implementation HorarioViewController

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

- (IBAction)btnDia:(id)sender {
    [self siguiente:@"dia"];
}

- (IBAction)btnNoche:(id)sender {
    [self siguiente:@"noche"];
}

- (IBAction)btnEnviar:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Personas"
                                                         inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSError *error;
    NSArray *fetchResults = [context executeFetchRequest:request error:&error];
    
    
    NSString *separator = @";";
    NSString *cvs = @"nombre;email\n";
    
    for (Personas *persona in fetchResults) {
        cvs = [NSString stringWithFormat:@"%@%@%@%@\n", cvs, [persona nombre], separator, [persona email]];
    }
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@"Envío de datos recopilados en Team Games"];
        //NSArray *toRecipients = [NSArray arrayWithObjects:@"fisrtMail@example.com", nil];
        //[mailer setToRecipients:toRecipients];
        [mailer addAttachmentData:[cvs dataUsingEncoding:NSUTF8StringEncoding] mimeType:@"application/text" fileName:@"datos.cvs"];
        NSString *emailBody = @"Envío automático de datos recopilados en Team Games";
        [mailer setMessageBody:emailBody isHTML:NO];
        [mailer setModalPresentationStyle:UIModalPresentationPageSheet];
        [self presentViewController:mailer animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR"
                                                        message:@"Tu dispositivo no soporta el envío de mail"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            [self alertaMensaje:@"Haz cancelado el envío de Mail" conTitulo:@"Correo Cancelado"];
            break;
        case MFMailComposeResultSaved:
            [self alertaMensaje:@"El correo se a salvado y puedes enviardo desde la app de Mail" conTitulo:@"Correo Salvado"];
            break;
        case MFMailComposeResultSent:
            [self alertaMensaje:@"Tu correo fue enviado" conTitulo:@"Enviado"];
            break;
        case MFMailComposeResultFailed:
            [self alertaMensaje:@"Ocurrio un error al intentar envíar el mail, intentalo nuevamente" conTitulo:@"ERROR"];
            break;
        default:
            [self alertaMensaje:@"Ocurrio un error al intentar envíar el mail, intentalo nuevamente" conTitulo:@"ERROR"];
            break;
    }
    // Remove the mail view
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void) alertaMensaje:(NSString *) mensaje conTitulo:(NSString *) titulo {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:titulo
                                                    message:mensaje
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void) siguiente: (NSString *) horario {
    PreguntasClass *preguntas = [PreguntasClass getInstance];
    preguntas.horario = horario;
    
    GeneroViewController *genero = [self.storyboard instantiateViewControllerWithIdentifier:@"generoID"];
    
    [self.navigationController pushViewController:genero animated:YES];
}
@end
