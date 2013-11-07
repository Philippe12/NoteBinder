//
//  Binder.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 07/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Document;

@interface Binder : NSManagedObject

@property (nonatomic, retain) NSString * information;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSSet *documents;
@end

@interface Binder (CoreDataGeneratedAccessors)

- (void)addDocumentsObject:(Document *)value;
- (void)removeDocumentsObject:(Document *)value;
- (void)addDocuments:(NSSet *)values;
- (void)removeDocuments:(NSSet *)values;

@end
