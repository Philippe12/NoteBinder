//
//  Note.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 07/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Document.h"

@class Media;

@interface Note : Document

@property (nonatomic, retain) NSData * texte;
@property (nonatomic, retain) NSSet *medias;
@end

@interface Note (CoreDataGeneratedAccessors)

- (void)addMediasObject:(Media *)value;
- (void)removeMediasObject:(Media *)value;
- (void)addMedias:(NSSet *)values;
- (void)removeMedias:(NSSet *)values;

@end
