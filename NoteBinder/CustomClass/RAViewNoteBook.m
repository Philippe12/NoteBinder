//
//  RAViewNoteBook.m
//  NoteBinder
//
//  Created by Philippe Fouquet on 08/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAViewNoteBook.h"

#define ZOME_FACTOR 3

@implementation RAViewNoteBook

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    mImage = [NSImage imageWithSize:self.bounds.size flipped:NO drawingHandler:^BOOL(NSRect dstRect){
        
        // Drawing code here.
        NSImage *image = [NSImage imageNamed:@"notebook_paper.jpg"]; //image for background
        [image setFlipped:NO];
        NSRect Spiral_Top = NSMakeRect(0, [image size].height-22, 25, 22);
        NSRect Top_Notebook = NSMakeRect(25, [image size].height-22, 25, 22);
        NSRect Spiral_Notebook = NSMakeRect(0, [image size].height-(22+6), 25, 6);
        NSRect Notebook = NSMakeRect(25, [image size].height-(22+6), 25, 6);
        
        NSRect rectForBorders = NSMakeRect(0,
                                           dstRect.size.height-(Spiral_Top.size.height*2),
                                           Spiral_Top.size.width*ZOME_FACTOR,
                                           Spiral_Top.size.height*ZOME_FACTOR);
        
        [image drawInRect:rectForBorders fromRect:Spiral_Top operation:NSCompositeSourceOver fraction:1.0];
        while (rectForBorders.origin.x < dstRect.size.width) {
            
            rectForBorders.origin.x += rectForBorders.size.width;
            [image drawInRect:rectForBorders fromRect:Top_Notebook operation:NSCompositeSourceOver fraction:1.0];
        }
        
        rectForBorders = NSMakeRect(0,
                                    dstRect.size.height-(Spiral_Top.size.height*2),
                                    Spiral_Notebook.size.width*ZOME_FACTOR,
                                    Spiral_Notebook.size.height*ZOME_FACTOR);
        
        while (rectForBorders.origin.y > 0) {
            
            rectForBorders.origin.y -= rectForBorders.size.height;
            rectForBorders.origin.x = 0;
            [image drawInRect:rectForBorders fromRect:Spiral_Notebook operation:NSCompositeSourceOver fraction:1.0];
            
            while (rectForBorders.origin.x < dstRect.size.width) {
                rectForBorders.origin.x += Notebook.size.width*ZOME_FACTOR;
                [image drawInRect:rectForBorders fromRect:Notebook operation:NSCompositeSourceOver fraction:1.0];
            }
        }
        
        rectForBorders.origin.x = 0;
        rectForBorders.origin.y -= rectForBorders.size.height-3;
        rectForBorders.size.width = Spiral_Top.size.width*ZOME_FACTOR;
        rectForBorders.size.height = Spiral_Top.size.height*ZOME_FACTOR;
        
        Spiral_Top = NSMakeRect(0, [image size].height-20, 25, 20);
        Top_Notebook = NSMakeRect(25, [image size].height-20, 25, 20);
        
        [image drawInRect:rectForBorders fromRect:Spiral_Top operation:NSCompositeSourceOver fraction:1.0];
        while (rectForBorders.origin.x < dstRect.size.width) {
            
            rectForBorders.origin.x += rectForBorders.size.width;
            [image drawInRect:rectForBorders fromRect:Top_Notebook operation:NSCompositeSourceOver fraction:1.0];
        }
        return true;
    }];
    [mImage drawInRect:dirtyRect fromRect:dirtyRect operation:NSCompositeSourceOver fraction:1.0];
}

@end
