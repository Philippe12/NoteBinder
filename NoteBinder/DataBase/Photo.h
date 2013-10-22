//
//  Photo.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 22/10/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Media.h"


@interface Photo : Media

@property (nonatomic, retain) NSData * data;

@end
