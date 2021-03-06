//
//  Document.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 07/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Binder;

@interface Document : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) Binder *binder;

- (id) documents;

@end
