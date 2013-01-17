//
//  RuletaViewController.h
//  Team Games
//
//  Created by Leonardo on 15-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RuletaViewController : UIViewController <AVAudioPlayerDelegate> {
    AVAudioPlayer *sonidoBoton;
    AVAudioPlayer *sonidoTorno;
    AVAudioPlayer *sonidoFinTorno;
}
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgColumna1;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgColumna2;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgColumna3;
@property (weak, nonatomic) IBOutlet UIImageView *imgFondo;
- (IBAction)btnIniciar:(id)sender;

@end
