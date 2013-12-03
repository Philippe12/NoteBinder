//
//  RAConfigPDF.m
//  NoteBinder
//
//  Created by Philippe Fouquet on 03/12/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAConfigPDF.h"

@interface RAConfigPDF ()

@end

@implementation RAConfigPDF

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
	self = [super initWithWindowNibName:@"RAConfigPDF"];
    
	return self;
}

- (void) loadDocument
{
    PDFDocument* doc = [[PDFDocument alloc] initWithData:mPDF.data];
    [_viewPDF setDocument:doc];
}

- (void)setPresistent:(id)val
{
    mPDF = val;
    [self loadDocument];
}

- (IBAction)OpenImage:(id)sender {
    NSOpenPanel *openPanel = [[NSOpenPanel alloc] init];
    [openPanel beginSheetModalForWindow:self.window completionHandler:^(NSInteger result) {
		if (result == NSFileHandlingPanelOKButton) {
            NSURL *url = [openPanel URL];
            NSData *data = [[NSData alloc] initWithContentsOfURL:url];
            if (mPDF) {
                mPDF.data = data;
                [self loadDocument];
            }
		} else {
			[openPanel close];
		}
	}];
}

@end
