//
//  RAPanelController.h
//  SortMedia
//
//  Created by Philippe Fouquet on 30/08/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RAPanelController : NSWindowController {
    NSManagedObjectContext *_moc;
    NSManagedObjectModel *_mom;
    NSPersistentStoreCoordinator *_psc;
}

- (id) initLoc;
- (id)initWithManagedObjectContext:(NSManagedObjectContext *)inMoc : (NSManagedObjectModel*) inMom : (NSPersistentStoreCoordinator *)inPsc;
- (void)setManagedObjectContext:(NSManagedObjectContext *)value;
- (void)setManagedObjectModel:(NSManagedObjectModel *)value;
- (void)setPersistentStoreCoordinator:(NSPersistentStoreCoordinator *)value;

- (NSManagedObjectContext *)managedObjectContext;
- (NSManagedObjectModel *)managedObjectModel;
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;

- (int)runAsPanel: (id)mainWindow;
-(id)getCurrent: (NSArrayController *) array;

- (IBAction)Quite:(id)sender;

@end
