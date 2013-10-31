//
//  RAConfigPeople.m
//  NoteBinder
//
//  Created by Philippe Fouquet on 31/10/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAConfigPeople.h"

@interface RAConfigPeople ()

@end

@implementation RAConfigPeople

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (id)initLoc {
	self = [super initWithWindowNibName:@"RAConfigPeople"];
    
	return self;
}

- (void)setPresistent:(id)val
{
    mPeople = val;
}

- (IBAction)ChoosePhoto:(id)sender {
    [_popover showRelativeToRect:[sender bounds]
                              ofView:sender
                       preferredEdge:NSMaxYEdge];
}

@end
