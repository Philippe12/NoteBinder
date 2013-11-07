//
//  RADocument.m
//  NoteBinder
//
//  Created by Philippe Fouquet on 17/10/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RADocument.h"
#import "Binder.h"
#import "People.h"
#import "RACustomSideBare.h"
#import "RAPanelController.h"
#import "RAConfigBinder.h"

@implementation RADocument

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"RADocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (void)awakeFromNib {
    parentArrayBinder = [[NSArrayController alloc] init];
    [parentArrayBinder setManagedObjectContext:self.managedObjectContext];
    [parentArrayBinder setEntityName:@"Binder"];
    [parentArrayBinder canRemove];
    [parentArrayBinder prepareContent];
    
    [_sidebarOutlineView setFloatsGroupRows:NO];
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:10];
    [_sidebarOutlineView expandItem:nil expandChildren:NO];
    [NSAnimationContext endGrouping];
    [_sidebarOutlineView setDoubleAction:@selector(doubleClickInTableView:)];
}

- (IBAction)AddPeople:(id)sender {
    NSArrayController *ptr = [[NSArrayController alloc] init];
    [ptr setManagedObjectContext:self.managedObjectContext];
    [ptr setEntityName:@"People"];
    [ptr prepareContent];
    
    People *people = [ptr newObject];
    people.name = @"new people";
    
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:0];
}

- (IBAction)doubleClickInTableView:(id)sender {
    id sel = [[_sidebarOutlineView itemAtRow:[_sidebarOutlineView selectedRow]] representedObject];
    if( sel == nil )
        return;
    
    NSString *str = [NSString stringWithFormat: @"RAConfig%@", [sel className], nil];
    id wnd = [NSClassFromString(str) alloc];
    if( wnd == nil )
        return;
    wnd = [wnd initWithManagedObjectContext:self.managedObjectContext :self.managedObjectModel :nil];
    [wnd setPresistent:sel];
    [wnd runAsPanel:self.windowForSheet];
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:0];
}

- (void)reloadData {
    [_sidebarOutlineView invalidateIntrinsicContentSize];
    [_sidebarOutlineView reloadData];
}

@end
