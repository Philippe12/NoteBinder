//
//  Editing.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 09/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Document.h"


@interface Editing : Document

@property (nonatomic, retain) NSNumber * lock;

@end
