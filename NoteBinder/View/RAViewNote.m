//
//  RAViewNote.m
//  NoteBinder
//
//  Created by Philippe Fouquet on 09/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAViewNote.h"

@interface RAViewNote ()

@end

@implementation RAViewNote

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (id)init
{
    self = [super initWithNibName:@"RAViewNote" bundle:nil];
    return self;
}

- (void)setPresistent:(id)val
{
    mNote = val;
}


@end
