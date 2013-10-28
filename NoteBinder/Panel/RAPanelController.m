//
//  RAPanelController.m
//  SortMedia
//
//  Created by Philippe Fouquet on 30/08/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAPanelController.h"

@interface RAPanelController ()

@end

@implementation RAPanelController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id) initLoc {
    return nil;
}

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)inMoc : (NSManagedObjectModel*) inMom : (NSPersistentStoreCoordinator *)inPsc
{
	self = [self initLoc];
    
	if(self) {
        [self setManagedObjectContext:inMoc];
        [self setManagedObjectModel:inMom];
        [self setPersistentStoreCoordinator:inPsc];
    }
    
	return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (int)runAsPanel: (id)mainWindow {
    [NSApp beginSheet:self.window
       modalForWindow:(NSWindow *)mainWindow
        modalDelegate:self.window
       didEndSelector:nil
          contextInfo:nil];
    
    NSInteger retvalue = [NSApp runModalForWindow:self.window];
    
    [NSApp endSheet:self.window];
    [self.window orderOut:self];
    
    return (int)retvalue;
}

- (void)setManagedObjectModel:(NSManagedObjectModel *)value
{
	// keep only weak ref
	_mom = value;
}

- (void)setManagedObjectContext:(NSManagedObjectContext *)value
{
	// keep only weak ref
	_moc = value;
}

- (void)setPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)value
{
    _psc = value;
}

- (NSManagedObjectContext *)managedObjectContext
{
	return _moc;
}

- (NSManagedObjectModel *)managedObjectModel
{
    return _mom;
}
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    return _psc;
}

-(id)getCurrent: (NSArrayController *) array{
    if ([[array selectedObjects] count] > 0) {
        return [[array selectedObjects] objectAtIndex:0];
    } else {
        return nil;
    }
}

- (IBAction)Quite:(id)sender {
    [NSApp stopModalWithCode:[sender tag]];
}

@end
