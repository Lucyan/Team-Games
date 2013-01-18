//
//  HazteFanViewController.h
//  Team Games
//
//  Created by Leonardo on 16-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface HazteFanViewController : UIViewController <AVAudioPlayerDelegate> {
    AVAudioPlayer *sonidoBoton;
}
@property (nonatomic, retain) NSString *vista;
- (IBAction)btnCerrar:(id)sender;

@end
