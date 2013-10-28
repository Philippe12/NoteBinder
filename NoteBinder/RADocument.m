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
        // Uppercase the string value, but don't set anything else. NSOutlineView automatically applies attributes as necessary
        //NSString *value = [item uppercaseString];
        [result setStringValue:item];
        return result;
        //return item;
    }
    else
    {
        // The cell is setup in IB. The textField and imageView outlets are properly setup.
        // Special attributes are automatically applied by NSTableView/NSOutlineView for the source list
        NSTableCellView *result = [outlineView makeViewWithIdentifier:@"MainCell" owner:self];
        result.textField.stringValue = [item valueForKey:@"name"];
        // Setup the icon based on our section
        /*id parent = [outlineView parentForItem:item];
        NSInteger index = [_topLevelItems indexOfObject:parent];
        NSInteger iconOffset = index % 4;
        switch (iconOffset) {
            case 0: {
                result.imageView.image = [NSImage imageNamed:NSImageNameIconViewTemplate];
                break;
            }
            case 1: {
                result.imageView.image = [NSImage imageNamed:NSImageNameHomeTemplate];
                break;
            }
            case 2: {
                result.imageView.image = [NSImage imageNamed:NSImageNameQuickLookTemplate];
                break;
            }
            case 3: {
                result.imageView.image = [NSImage imageNamed:NSImageNameSlideshowTemplate];
                break;
            }
        }
        BOOL hideUnreadIndicator = YES;
        // Setup the unread indicator to show in some cases. Layout is done in SidebarTableCellView's viewWillDraw
        if (index == 0) {
            // First row in the index
            hideUnreadIndicator = NO;
            [result.button setTitle:@"42"];
            [result.button sizeToFit];
            // Make it appear as a normal label and not a button
            [[result.button cell] setHighlightsBy:0];
        } else if (index == 2) {
            // Example for a button
            hideUnreadIndicator = NO;
            result.button.target = self;
            result.button.action = @selector(buttonClicked:);
            [result.button setImage:[NSImage imageNamed:NSImageNameAddTemplate]];
            // Make it appear as a button
            [[result.button cell] setHighlightsBy:NSPushInCellMask|NSChangeBackgroundCellMask];
        }
        [result.button setHidden:hideUnreadIndicator];*/
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
    id ptr = [_sidebarOutlineView parentForItem:sel];
    NSArrayController *array = [parentArray objectForKey:ptr];
    [array remove:sel];
    
    [self performSelector:@selector(reloadData) withObject:nil afterDelay:0];
}

- (void)reloadData {
    [_sidebarOutlineView reloadData];
}

@end
