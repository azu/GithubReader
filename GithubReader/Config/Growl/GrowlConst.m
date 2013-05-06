//
// Created by azu on 2013/05/06.
//


#import <Growl/Growl.h>
#import "GrowlConst.h"

const struct GrowlAttributes GrowlAttributes = {
    .key = @"info.efcl.GithubReader.growlNotificationKey"
};


@implementation GrowlConst {

}
+ (void)notifyTitle:(NSString *) title description:(NSString *) description {
    [GrowlApplicationBridge notifyWithTitle:title
                            description:description
                            notificationName:GrowlAttributes.key
                            iconData:nil
                            priority:0
                            isSticky:NO
                            clickContext:nil];
}
@end