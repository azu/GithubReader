//
// Created by azu on 2013/05/03.
//


#import <Foundation/Foundation.h>
#import "GithubEventType.h"

@class GithubEventType;

@interface MessageCellView : NSTableCellView {
}
@property(weak, nonatomic) IBOutlet NSImageView *iconImage;
@property(weak, nonatomic) IBOutlet NSTextField *titleTextField;
@property(weak, nonatomic) IBOutlet NSTextField *subjectTextField;

- (void)setIconType:(NSString *) eventType;
@end