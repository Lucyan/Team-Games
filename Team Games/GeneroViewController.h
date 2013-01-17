//
//  GeneroViewController.h
//  Tem Games
//
//  Created by Leonardo on 13-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface GeneroViewController : UIViewController <UIGestureRecognizerDelegate, AVAudioPlayerDelegate> {
    AVAudioPlayer *sonidoBoton;
}
- (IBAction)btnHombre:(id)sender;
- (IBAction)btnMujer:(id)sender;
- (IBAction)btnVolver:(id)sender;
- (IBAction)btnVideo:(id)sender;

@end
