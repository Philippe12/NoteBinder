//
//  RADocument.m
//  NoteBinder
//
//  Created by Philippe Fouquet on 17/10/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RADocument.h"
#import "People.h"
#import "Note.h"
#import "Meeting.h"
#import "Photo.h"
#import "PDF.h"
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

- (BOOL)outlineView:(NSOutlineView *)outlineView isGroupItem:(id)item {
    if([outlineView parentForItem:item] == nil)
        return YES;
    return NO;
}

- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item  {
    NSTableCellView *result = [outlineView makeViewWithIdentifier:@"MyCell" owner:self];
    [result setObjectValue:[item representedObject]];
    return result;
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

- (IBAction)AddBinder:(id)sender {
    NSArrayController *ptr = [[NSArrayController alloc] init];
    [ptr setManagedObjectContext:self.managedObjectContext];
    [ptr setEntityName:@"Binder"];
    [ptr prepareContent];
    
    Binder *binder = [ptr newObject];
    binder.name = @"new binder";
    
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:0];
}

- (IBAction)AddNote:(id)sender {
    NSArrayController *ptr = [[NSArrayController alloc] init];
    [ptr setManagedObjectContext:self.managedObjectContext];
    [ptr setEntityName:@"Note"];
    [ptr prepareContent];
    
    Binder *selectbinder = [ self GetBinderSelected];
    
    Note *note = [ptr newObject];
    note.name = @"new note";
    [selectbinder addDocumentsObject:note];
    
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:0];
}

- (IBAction)AddMeeting:(id)sender {
    NSArrayController *ptr = [[NSArrayController alloc] init];
    [ptr setManagedObjectContext:self.managedObjectContext];
    [ptr setEntityName:@"Meeting"];
    [ptr prepareContent];
    
    Binder *selectbinder = [ self GetBinderSelected];
    
    Meeting *meeting = [ptr newObject];
    meeting.name = @"new meeting";
    [selectbinder addDocumentsObject:meeting];
    
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:0];
}

- (IBAction)AddPhoto:(id)sender {
    NSArrayController *ptr = [[NSArrayController alloc] init];
    [ptr setManagedObjectContext:self.managedObjectContext];
    [ptr setEntityName:@"Photo"];
    [ptr prepareContent];
    
    Binder *selectbinder = [ self GetBinderSelected];
    
    Photo *photo = [ptr newObject];
    photo.name = @"new photo";
    [selectbinder addDocumentsObject:photo];
    
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:0];
}

- (IBAction)AddPdf:(id)sender {
    NSArrayController *ptr = [[NSArrayController alloc] init];
    [ptr setManagedObjectContext:self.managedObjectContext];
    [ptr setEntityName:@"PDF"];
    [ptr prepareContent];
    
    Binder *selectbinder = [ self GetBinderSelected];
    
    PDF *pdf = [ptr newObject];
    pdf.name = @"new PDF";
    [selectbinder addDocumentsObject:pdf];
    
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:0];
}

- (void)reloadData {
    [_sidebarOutlineView invalidateIntrinsicContentSize];
    [_sidebarOutlineView reloadData];
}

- (Binder*)GetBinderSelected
{
    id sel = [[_sidebarOutlineView itemAtRow:[_sidebarOutlineView selectedRow]] representedObject];
    while ([sel class] != [Binder class]) {
        sel = [sel binder];
    }
    return sel;
}

@end
