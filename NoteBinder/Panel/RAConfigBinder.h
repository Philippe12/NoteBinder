//
//  RAConfigBinder.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 28/10/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAPanelController.h"
#import "Binder.h"

@interface RAConfigBinder : RAPanelController
{
@private
    Binder *mBinder;
}

- (void)setBinder:(Binder*)val;
- (IBAction)OpenImage:(id)sender;

@end
