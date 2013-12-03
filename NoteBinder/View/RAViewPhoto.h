//
//  RAViewPhoto.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 27/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Photo.h"

@interface RAViewPhoto : NSViewController{
    Photo *mPhoto;
}

- (void)setPresistent:(id)val;

@end
