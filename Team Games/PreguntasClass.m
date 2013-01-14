//
//  PreguntasClass.m
//  Tem Games
//
//  Created by Leonardo on 13-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import "PreguntasClass.h"

@implementation PreguntasClass
@synthesize datos, horario, genero;

static PreguntasClass *instancia = nil;

+(PreguntasClass *) getInstance {
    @synchronized(self) {
        if (instancia == nil) {
            instancia = [PreguntasClass new];
            [instancia iniciar:instancia];
        }
    }
    
    return instancia;
}

-(void) iniciar:(PreguntasClass *) instance {
    // Día Hombres
    NSArray *diaHombres = [[NSArray alloc] initWithObjects:[[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 1", @"titulo",
                                                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 2", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 3", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 4", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 5", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 6", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          nil];
    
    // Día Mujeres
    NSArray *diaMujeres = [[NSArray alloc] initWithObjects:[[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 1", @"titulo",
                                                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 2", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 3", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 4", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 5", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 6", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          nil];
    
    // Noche Hombres
    NSArray *nocheHombres = [[NSArray alloc] initWithObjects:[[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 1", @"titulo",
                                                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 2", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 3", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 4", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 5", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 6", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          nil];
    
    // Noche Mujeres
    NSArray *nocheMujeres = [[NSArray alloc] initWithObjects:[[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 1", @"titulo",
                                                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 2", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 3", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 4", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 5", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:@"Prueba 6", @"titulo",
                           @"Lorem ipsus bla bla bla", @"descripcion", nil],
                          nil];
    
    NSDictionary *dia = [[NSDictionary alloc] initWithObjectsAndKeys:diaHombres, @"hombre", diaMujeres, @"mujer", nil];
    NSDictionary *noche = [[NSDictionary alloc] initWithObjectsAndKeys:nocheHombres, @"hombre", nocheMujeres, @"mujer", nil];
    
    NSDictionary *final = [[ NSDictionary alloc] initWithObjectsAndKeys:dia, @"dia", noche, @"noche", nil];
    
    instance.datos = final;
}

@end
