//
//  RAStateButtonTranformer.m
//  NoteBinder
//
//  Created by Philippe Fouquet on 12/11/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAStateButtonTranformer.h"

@implementation RAStateButtonTranformer

+(Class)transformedValueClass {
    return [NSNumber class];
}

-(id)transformedValue:(id)value {
    if (value == nil) {
        return nil;
    } else if( [value class] == [NSButton class]){
        NSButton *ptr = value;
        NSNumber *ret = [[NSNumber alloc] initWithBool:[ptr state] == 0];
        return ret;
    }
    return nil;
}

@end
