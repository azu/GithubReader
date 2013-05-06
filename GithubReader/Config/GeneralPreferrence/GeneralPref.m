//
// Created by azu on 2013/05/06.
//


#import "GeneralPref.h"

extern const struct GeneralAttributes {
    __unsafe_unretained NSString *refreshInterval;
} GeneralAttributes;

const struct GeneralAttributes General = {
    .refreshInterval = @"General.refreshInterval"
};


@implementation GeneralPref {

}
+ (void)initialize {
    [super initialize];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults registerDefaults:@{
        General.refreshInterval : @(1)
    }];

}

+ (NSNumber *)refreshInterval {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:General.refreshInterval];
}

+ (void)setRefreshInterval:(NSNumber *) value {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:General.refreshInterval];
    [defaults synchronize];
}
@end