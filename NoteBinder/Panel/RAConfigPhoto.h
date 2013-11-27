//
//  RAConfigPhoto.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 27/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAPanelController.h"
#import "Photo.h"

@interface RAConfigPhoto : RAPanelController
{
@private
    Photo *mPhoto;
}

- (void)setPresistent:(id)val;
- (IBAction)OpenImage:(id)sender;

@end
