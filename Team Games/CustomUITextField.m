//
//  CustomUITextField.m
//  Team Games
//
//  Created by Leonardo on 15-01-13.
//  Copyright (c) 2013 devTrash. All rights reserved.
//

#import "CustomUITextField.h"

@implementation CustomUITextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self setFont:[UIFont fontWithName:@"QType Pro" size:25.0]];
}


- (void)drawPlaceholderInRect:(CGRect)rect {
    [[UIColor blackColor] setFill];
    [[self placeholder] drawInRect:rect withFont:[UIFont fontWithName:@"QType Pro" size:25.0]];
}

@end
