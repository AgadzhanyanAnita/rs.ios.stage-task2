#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger count = 0;
    for (NSNumber *firstValue in array) {
        for (NSNumber *value in array) {
            if ([firstValue intValue] - [value intValue] == [number intValue]) {
                count++;
            }
        }
    }
    return count;
}

@end
