//
//  Media.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 07/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Document.h"

@class Note;

@interface Media : Document

@property (nonatomic, retain) NSData * data;
@property (nonatomic, retain) NSSet *notes;
@end

@interface Media (CoreDataGeneratedAccessors)

- (void)addNotesObject:(Note *)value;
- (void)removeNotesObject:(Note *)value;
- (void)addNotes:(NSSet *)values;
- (void)removeNotes:(NSSet *)values;

@end
