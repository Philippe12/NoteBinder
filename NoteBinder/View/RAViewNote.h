//
//  RAViewNote.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 09/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Note.h"

@interface RAViewNote : NSViewController {
    Note *mNote;
}

- (void)setPresistent:(id)val;

@end
