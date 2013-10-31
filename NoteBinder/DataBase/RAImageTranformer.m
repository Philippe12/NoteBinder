//
//  RAImageTranformer.m
//  SortMedia
//
//  Created by Philippe Fouquet on 10/05/13.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAImageTranformer.h"

@implementation RAImageTranformer

+(Class)transformedValueClass {
    return [NSImage class];
}

-(id)transformedValue:(id)value {
    if (value == nil) {
        return nil;
    } else {
        return [[NSImage alloc] initWithData:value];
    }
}

@end
