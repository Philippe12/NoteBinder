//
//  People.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 07/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Meeting;

@interface People : NSManagedObject

@property (nonatomic, retain) NSString * information;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSSet *meetings;
@end

@interface People (CoreDataGeneratedAccessors)

- (void)addMeetingsObject:(Meeting *)value;
- (void)removeMeetingsObject:(Meeting *)value;
- (void)addMeetings:(NSSet *)values;
- (void)removeMeetings:(NSSet *)values;

@end
