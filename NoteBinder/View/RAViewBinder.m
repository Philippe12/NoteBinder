//
//  RAViewBinder.m
//  NoteBinder
//
//  Created by Philippe Fouquet on 07/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAViewBinder.h"

@interface RAViewBinder ()

@end

@implementation RAViewBinder

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
    self = [super initWithNibName:@"RAViewBinder" bundle:nil];
    return self;
}

- (void)setPresistent:(id)val
{
    mBinder = val;
}

@end
