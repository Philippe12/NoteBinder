//
//  RAConfigNote.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 07/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAPanelController.h"
#import "Note.h"

@interface RAConfigNote : RAPanelController
{
@private
    Note *mNote;
}

- (void)setPresistent:(id)val;
- (IBAction)OpenImage:(id)sender;

@end
