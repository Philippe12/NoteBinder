//
//  RACustomSideBare.m
//  NoteBinder
//
//  Created by Philippe Fouquet on 27/10/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RACustomSideBare.h"

@implementation RACustomSideBare

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

- (NSMenu*)menuForEvent:(NSEvent *)theEvent
{
    return self.menu;
}

@end
