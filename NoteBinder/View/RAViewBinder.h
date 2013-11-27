//
//  RAViewBinder.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 07/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Binder.h"

@interface RAViewBinder : NSViewController {
    Binder *mBinder;
}

- (void)setPresistent:(id)val;

@end
