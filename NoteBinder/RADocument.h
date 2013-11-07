//
//  RADocument.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 17/10/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RADocument : NSPersistentDocument {
@private
    NSArrayController *parentArrayBinder;
}

@property (strong) IBOutlet NSOutlineView *sidebarOutlineView;

- (IBAction)AddPeople:(id)sender;
- (IBAction)Delete:(id)sender;
- (IBAction)doubleClickInTableView:(id)sender;

@end
