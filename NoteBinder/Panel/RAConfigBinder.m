//
//  RAConfigBinder.m
//  NoteBinder
//
//  Created by Philippe Fouquet on 28/10/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAConfigBinder.h"

@interface RAConfigBinder ()

@end

@implementation RAConfigBinder

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
	self = [super initWithWindowNibName:@"RAConfigBinder"];
    
	return self;
}

- (void)setPresistent:(id)val
{
    mBinder = val;
}

- (IBAction)OpenImage:(id)sender {
    NSOpenPanel *openPanel = [[NSOpenPanel alloc] init];
    [openPanel beginSheetModalForWindow:self.window completionHandler:^(NSInteger result) {
		if (result == NSFileHandlingPanelOKButton) {
            NSURL *url = [openPanel URL];
            NSData *data = [[NSData alloc] initWithContentsOfURL:url];
            if (mBinder) {
                mBinder.photo = data;
            }
		} else {
			[openPanel close];
		}
	}];
}

@end
