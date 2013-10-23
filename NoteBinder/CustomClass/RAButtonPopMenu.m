//
//  RAButtonPopMenu.m
//  NoteBinder
//
//  Created by Philippe Fouquet on 23/10/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAButtonPopMenu.h"

@implementation RAButtonPopMenu

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	
    // Drawing code here.
}

- (void)mouseDown:(NSEvent *)theEvent
{
    [NSMenu popUpContextMenu:self.menu withEvent:theEvent forView:self];
}

@end
