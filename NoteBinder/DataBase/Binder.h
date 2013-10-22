//
//  Binder.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 22/10/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Binder : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * information;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSSet *documents;
@end

@interface Binder (CoreDataGeneratedAccessors)

- (void)addDocumentsObject:(NSManagedObject *)value;
- (void)removeDocumentsObject:(NSManagedObject *)value;
- (void)addDocuments:(NSSet *)values;
- (void)removeDocuments:(NSSet *)values;

@end
