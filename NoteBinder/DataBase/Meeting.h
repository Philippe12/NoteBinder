//
//  Meeting.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 07/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Note.h"

@class People;

@interface Meeting : Note

@property (nonatomic, retain) NSSet *peoples;
@end

@interface Meeting (CoreDataGeneratedAccessors)

- (void)addPeoplesObject:(People *)value;
- (void)removePeoplesObject:(People *)value;
- (void)addPeoples:(NSSet *)values;
- (void)removePeoples:(NSSet *)values;

@end
