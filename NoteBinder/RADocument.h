//
//  RADocument.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 17/10/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Binder.h"

@interface RADocument : NSPersistentDocument <NSOutlineViewDelegate> {
@private
    NSArrayController *parentArrayBinder;
    NSViewController *_currentContentViewController;
}

- (Binder*)GetBinderSelected;

@property (strong) IBOutlet NSOutlineView *sidebarOutlineView;
@property (strong) IBOutlet NSView *mainContentView;

- (IBAction)AddPeople:(id)sender;
- (IBAction)doubleClickInTableView:(id)sender;
- (IBAction)AddBinder:(id)sender;
- (IBAction)AddNote:(id)sender;
- (IBAction)AddMeeting:(id)sender;
- (IBAction)AddPhoto:(id)sender;
- (IBAction)AddPdf:(id)sender;

@end
