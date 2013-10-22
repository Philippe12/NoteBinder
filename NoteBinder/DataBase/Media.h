//
//  Media.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 22/10/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Media : NSManagedObject

@property (nonatomic, retain) NSSet *notes;
@end

@interface Media (CoreDataGeneratedAccessors)

- (void)addNotesObject:(NSManagedObject *)value;
- (void)removeNotesObject:(NSManagedObject *)value;
- (void)addNotes:(NSSet *)values;
- (void)removeNotes:(NSSet *)values;

@end
