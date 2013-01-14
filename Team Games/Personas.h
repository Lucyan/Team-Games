//
//  Personas.h
//  Team Games
//
//  Created by Leonardo on 13-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Personas : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * email;

@end
