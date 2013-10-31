//
//  RAConfigPeople.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 31/10/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAPanelController.h"
#import "People.h"

@interface RAConfigPeople : RAPanelController
{
@private
    People *mPeople;
}

- (void)setPresistent:(id)val;
- (IBAction)ChoosePhoto:(id)sender;
@property (strong) IBOutlet NSPopover *popover;

@end
