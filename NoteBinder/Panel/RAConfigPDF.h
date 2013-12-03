//
//  RAConfigPDF.h
//  NoteBinder
//
//  Created by Philippe Fouquet on 03/12/2013.
//  Copyright (c) 2013 Philippe Fouquet. All rights reserved.
//

#import "RAPanelController.h"
#import "PDF.h"
#import <Quartz/Quartz.h>

@interface RAConfigPDF : RAPanelController
{
@private
    PDF *mPDF;
}

@property (strong) IBOutlet PDFView *viewPDF;
- (void)setPresistent:(id)val;
- (IBAction)OpenImage:(id)sender;

@end
