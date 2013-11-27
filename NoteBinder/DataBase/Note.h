//
//  Note.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 09/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Editing.h"

@class Media;

@interface Note : Editing

@property (nonatomic, retain) NSData * texte;
@property (nonatomic, retain) NSSet *medias;
@end

@interface Note (CoreDataGeneratedAccessors)

- (void)addMediasObject:(Media *)value;
- (void)removeMediasObject:(Media *)value;
- (void)addMedias:(NSSet *)values;
- (void)removeMedias:(NSSet *)values;

@end
