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
    NSArray *diaHombres = [[NSArray alloc] initWithObjects:
                           [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"El Fotógrafo", @"titulo",
                            @"Préndete con Bacardi para romper el hielo!", @"subtitulo",
                            @"Usa tu poder de seducción, para conseguir la mayor cantidad de fotos con mujeres besándote en la mejilla.", @"descripcion",
                            @"fotografo.png", @"imagen",
                            nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"La Depilada", @"titulo",
                           @"Destapa tu cuerpo… como una botella de Bacardi!", @"subtitulo",
                           @"Respira profundo y aguanta la depilación de alguna zona de tu cuerpo.", @"descripcion",
                           @"depilada.png", @"imagen",
                           nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"El Cejón", @"titulo",
                           @"Ese Bacardí lo tengo entre ceja y ceja", @"subtitulo",
                           @"Supera el pudor y recibe un corte en una de tus cejas.", @"descripcion",
                           @"cejon.png", @"imagen",
                           nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"La Llamada Perdida", @"titulo",
                           @"Con Bacardí nunca pasaras un mal trago", @"subtitulo",
                           @"Usa todas tus armas para conseguir 6 llamadas perdidas en tu teléfono.", @"descripcion",
                           @"llamada.png", @"imagen",
                           nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"El Coro", @"titulo",
                           @"Entona afinado para preparar la garganta", @"subtitulo",
                           @"Debes cantar una canción a viva voz con 4 personas.", @"descripcion",
                           @"coro.png", @"imagen",
                           nil],
                          nil];
    
    // Día Mujeres
    NSArray *diaMujeres = [[NSArray alloc] initWithObjects:
                           [[NSDictionary alloc] initWithObjectsAndKeys:
                            @"La Fotógrafa", @"titulo",
                            @"Préndete con Bacardi para romper el hielo!", @"subtitulo",
                            @"Usa tu sensualidad para conseguir  5 fotos con hombres marcados con un tatuaje de Bacardi.", @"descripcion",
                            @"fotografo.png", @"imagen",
                            nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"La Depilada", @"titulo",
                           @"Destapa tu cuerpo… como una botella de Bacardi!", @"subtitulo",
                           @"Usa tu persuasión, para conseguir que un hombre se depile una parte de su cuerpo.", @"descripcion",
                           @"depilada.png", @"imagen",
                           nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"La Cejona", @"titulo",
                           @"Ese Bacardí lo tengo entre ceja y ceja", @"subtitulo",
                           @"Debes lograr de cualquier forma posible que un hombre se corte una línea de su ceja.", @"descripcion",
                           @"cejon.png", @"imagen",
                           nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"La Llamada Perdida", @"titulo",
                           @"Con Bacardí nunca pasaras un mal trago", @"subtitulo",
                           @"Usa todas tus armas para conseguir 6 llamadas perdidas en tu teléfono.", @"descripcion",
                           @"llamada.png", @"imagen",
                           nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"El Entrenamiento", @"titulo",
                           @"Entrena duro para no quedar botella", @"subtitulo",
                           @"Con tu seducción debes conseguir  100 \"Push Up\" de los hombres a tu alrededor.", @"descripcion",
                           @"entrenamiento.png", @"imagen",
                           nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"El Coro", @"titulo",
                           @"Entona afinado para preparar la garganta", @"subtitulo",
                           @"Debes cantar una canción a viva voz con 4 personas.", @"descripcion",
                           @"coro.png", @"imagen",
                           nil],
                          nil];
    
    // Noche Hombres
    NSArray *nocheHombres = [[NSArray alloc] initWithObjects:
                             [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"La Depilada", @"titulo",
                              @"Destapa tu cuerpo… como una botella de Bacardi!", @"subtitulo",
                              @"Respira profundo y aguanta la depilación de alguna zona de tu cuerpo.", @"descripcion",
                              @"depilada.png", @"imagen",
                              nil],
                             [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"El Cejón", @"titulo",
                              @"Ese Bacardí lo tengo entre ceja y ceja", @"subtitulo",
                              @"Supera el pudor y recibe un corte en una de tus cejas.", @"descripcion",
                              @"cejon.png", @"imagen",
                              nil],
                             [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"La Llamada Perdida", @"titulo",
                              @"Con Bacardí nunca pasaras un mal trago", @"subtitulo",
                              @"Usa todas tus armas para conseguir 6 llamadas perdidas en tu teléfono.", @"descripcion",
                              @"llamada.png", @"imagen",
                              nil],
                             [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"El Mechón", @"titulo",
                              @"¡Despéinate con Bacardí!", @"subtitulo",
                              @"Debes cortarte un mechón de pelo para conseguir el objetivo.", @"descripcion",
                              @"mechon.png", @"imagen",
                              nil],
                             [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"El Coro", @"titulo",
                              @"Entona afinado para preparar la garganta", @"subtitulo",
                              @"Debes cantar una canción a viva voz con 4 personas.", @"descripcion",
                              @"coro.png", @"imagen",
                              nil],
                             nil];
    
    // Noche Mujeres
    NSArray *nocheMujeres = [[NSArray alloc] initWithObjects:
                             [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"La Depilada", @"titulo",
                              @"Destapa tu cuerpo… como una botella de Bacardi!", @"subtitulo",
                              @"Usa tu persuasión, para conseguir que un hombre se depile una parte de su cuerpo.", @"descripcion",
                              @"depilada.png", @"imagen",
                              nil],
                             [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"La Cejona", @"titulo",
                              @"Ese Bacardí lo tengo entre ceja y ceja", @"subtitulo",
                              @"Debes lograr de cualquier forma posible que un hombre se corte una línea de su ceja.", @"descripcion",
                              @"cejon.png", @"imagen",
                              nil],
                             [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"El Mechón", @"titulo",
                              @"¡Despéinate con Bacardí!", @"subtitulo",
                              @"Debes conseguir que un hombre se corte un mechón de pelo para conseguir el objetivo.", @"descripcion",
                              @"mechon.png", @"imagen",
                              nil],
                             [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"La Llamada Perdida", @"titulo",
                              @"Con Bacardí nunca pasaras un mal trago", @"subtitulo",
                              @"Usa todas tus armas para conseguir 6 llamadas perdidas en tu teléfono.", @"descripcion",
                              @"llamada.png", @"imagen",
                              nil],
                             [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"El Coro", @"titulo",
                              @"Entona afinado para preparar la garganta", @"subtitulo",
                              @"Debes cantar una canción a viva voz con 4 personas.", @"descripcion",
                              @"coro.png", @"imagen",
                              nil],
                             nil];
    
    NSDictionary *dia = [[NSDictionary alloc] initWithObjectsAndKeys:diaHombres, @"hombre", diaMujeres, @"mujer", nil];
    NSDictionary *noche = [[NSDictionary alloc] initWithObjectsAndKeys:nocheHombres, @"hombre", nocheMujeres, @"mujer", nil];
    
    NSDictionary *final = [[ NSDictionary alloc] initWithObjectsAndKeys:dia, @"dia", noche, @"noche", nil];
    
    instance.datos = final;
}

@end
