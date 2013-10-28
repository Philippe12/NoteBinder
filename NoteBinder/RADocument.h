//
//  RADocument.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 17/10/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RADocument : NSPersistentDocument <NSOutlineViewDelegate, NSOutlineViewDataSource> {
@private
    NSMutableDictionary *parentArray;
}

@property (strong) IBOutlet NSOutlineView *sidebarOutlineView;
@property (strong) IBOutlet NSArrayController *PeopleList;
@property (strong) IBOutlet NSArrayController *BinderList;
- (IBAction)AddBinder:(id)sender;
- (IBAction)AddPeople:(id)sender;
- (IBAction)Delete:(id)sender;

@end
