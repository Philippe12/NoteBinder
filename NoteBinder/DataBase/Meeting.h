//
//  Meeting.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 22/10/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Meeting : NSManagedObject

@property (nonatomic, retain) NSSet *peoples;
@end

@interface Meeting (CoreDataGeneratedAccessors)

- (void)addPeoplesObject:(NSManagedObject *)value;
- (void)removePeoplesObject:(NSManagedObject *)value;
- (void)addPeoples:(NSSet *)values;
- (void)removePeoples:(NSSet *)values;

@end
