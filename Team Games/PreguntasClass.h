//
//  PreguntasClass.h
//  Tem Games
//
//  Created by Leonardo on 13-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PreguntasClass : NSObject {
    NSDictionary *datos;
    NSString *horario;
    NSString *genero;
}

@property (nonatomic, retain) NSDictionary *datos;
@property (nonatomic, retain) NSString *horario;
@property (nonatomic, retain) NSString *genero;

+(PreguntasClass *) getInstance;

@end
