//
// Created by azu on 2013/05/03.
//


#import <Foundation/Foundation.h>

@class TUINSView;


@interface MessageCellView : NSTableCellView {
}

@property(weak, nonatomic) IBOutlet TUINSView *backgroundView;
@property(weak, nonatomic) IBOutlet NSTextField *titleTextField;

@property(weak, nonatomic) IBOutlet NSTextField *subjectTextField;

@end