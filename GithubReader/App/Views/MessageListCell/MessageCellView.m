//
// Created by azu on 2013/05/03.
//


#import "MessageCellView.h"
#import "NIKFontAwesomeIcon.h"
#import "NIKFontAwesomeIconFactory.h"
#import "NIKFontAwesomeIconFactory+OSX.h"

@implementation MessageCellView {

}
- (void)setIconType:(NSString *) eventType {
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory bevelButtonIconFactory];
    NIKFontAwesomeIcon awesomeIcon = NIKFontAwesomeIconPencil;
    if ([eventType isEqualToString:@"Issue"]) {
        awesomeIcon = NIKFontAwesomeIconComment;
    }else if ([eventType isEqualToString:@"PullRequest"]) {
        awesomeIcon = NIKFontAwesomeIconStethoscope;
    }else if ([eventType isEqualToString:@"Commit"]) {
        awesomeIcon = NIKFontAwesomeIconPencil;
    }
    NIKImage *image = [factory createImageForIcon:awesomeIcon];
    [self.iconImage setImage:image];
}


@end