//
// Created by azu on 2013/05/06.
//


#import <Growl/Growl.h>
#import "GrowlConst.h"
#import "AZGrowlDelegate.h"

const struct GrowlAttributes GrowlAttributes = {
    .key = @"info.efcl.GithubReader.growlNotificationKey"
};


@implementation GrowlConst {

}
+ (void)notifyTitle:(NSString *) title description:(NSString *) description context:(id) context {
    [GrowlApplicationBridge setGrowlDelegate:[AZGrowlDelegate sharedManager]];
    [GrowlApplicationBridge notifyWithTitle:title
                            description:description
                            notificationName:GrowlAttributes.key
                            iconData:nil priority:0
                            isSticky:NO clickContext:context];
}
@end