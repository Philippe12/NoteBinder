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
}

- (Binder*)GetBinderSelected;

@property (strong) IBOutlet NSOutlineView *sidebarOutlineView;

- (IBAction)AddPeople:(id)sender;
- (IBAction)doubleClickInTableView:(id)sender;
- (IBAction)AddNote:(id)sender;
- (IBAction)AddMetting:(id)sender;
- (IBAction)AddPhoto:(id)sender;
- (IBAction)AddPdf:(id)sender;

@end
