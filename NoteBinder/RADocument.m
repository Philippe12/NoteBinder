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
        parentArray = [[NSMutableDictionary alloc] init];
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
    NSArrayController *ptr;
    ptr = [[NSArrayController alloc] init];
    [ptr setManagedObjectContext:self.managedObjectContext];
    [ptr setEntityName:@"Binder"];
    [ptr canRemove];
    [ptr prepareContent];
    [parentArray setObject:ptr forKey:@"Binder"];

    ptr = [[NSArrayController alloc] init];
    [ptr setManagedObjectContext:self.managedObjectContext];
    [ptr setEntityName:@"People"];
    [ptr canRemove];
    [ptr prepareContent];
    [parentArray setObject:ptr forKey:@"People"];
    
    [_sidebarOutlineView setFloatsGroupRows:NO];
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:10];
    [_sidebarOutlineView expandItem:nil expandChildren:NO];
    [NSAnimationContext endGrouping];
    [_sidebarOutlineView setDoubleAction:@selector(doubleClickInTableView:)];
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index
           ofItem:(id)item {
    if(nil == item) {
        return [[parentArray allKeys] objectAtIndex:index];
    } else {
        return [[[parentArray objectForKey:item] arrangedObjects] objectAtIndex:index];
    }
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    if ([outlineView parentForItem:item] == nil) {
        return YES;
    } else {
        return NO;
    }
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView
  numberOfChildrenOfItem:(id)item {
    if(nil == item)
        return [parentArray count];
    else
        return [[[parentArray objectForKey:item] arrangedObjects] count];
}

- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item  {
    if([outlineView parentForItem:item] == nil)
    {
        NSTextField *result = [outlineView makeViewWithIdentifier:@"HeaderTextField" owner:self];
        [result setStringValue:item];
        [result setMenu:nil];
        return result;
    }
    else
    {
        RACustomSideBare *result = [outlineView makeViewWithIdentifier:@"MainCell" owner:self];
        result.textField.stringValue = [item valueForKey:@"name"];
        [result setToolTip:[item valueForKey:@"information"]];
        
        NSImage *img = [[NSImage alloc] initWithData:[item valueForKey:@"photo"]];
        if( img == nil )
            [result.imageView.image setTemplate:TRUE];
        else
            result.imageView.image = img;

        return result;
    }
}

- (BOOL)outlineView:(NSOutlineView *)outlineView shouldShowOutlineCellForItem:(id)item {
    return YES;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isGroupItem:(id)item {
    if([outlineView parentForItem:item] == nil)
        return YES;
    return NO;
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

- (IBAction)AddPeople:(id)sender {
    NSArrayController *ptr = [[NSArrayController alloc] init];
    [ptr setManagedObjectContext:self.managedObjectContext];
    [ptr setEntityName:@"People"];
    [ptr prepareContent];
    
    People *people = [ptr newObject];
    people.name = @"new people";
    
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:0];
}

- (IBAction)Delete:(id)sender {
    id sel = [_sidebarOutlineView itemAtRow:[_sidebarOutlineView selectedRow]];
    if( sel == nil )
        return;
    id ptr = [_sidebarOutlineView parentForItem:sel];
    NSArrayController *array = [parentArray objectForKey:ptr];
    [array remove:sel];
    
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:0];
}

- (IBAction)Configure:(id)sender {
}

- (IBAction)doubleClickInTableView:(id)sender {
    id sel = [_sidebarOutlineView itemAtRow:[_sidebarOutlineView selectedRow]];
    if( sel == nil )
        return;
    
    NSString *str = [NSString stringWithFormat: @"RAConfig%@", [sel className], nil];
    id wnd = [NSClassFromString(str) alloc];
    if( wnd == nil )
        return;
    wnd = [wnd initWithManagedObjectContext:self.managedObjectContext :self.managedObjectModel :nil];
    [wnd setBinder:(Binder*)sel];
    [wnd runAsPanel:self.windowForSheet];
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:0];
}

- (void)reloadData {
    [_sidebarOutlineView reloadData];
}

@end
