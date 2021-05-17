#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    //
    NSString *answer = @"";
    int count = 0;
    
    if (numbersArray.count == 0) {
        return answer;
    }
    for (NSNumber *value in numbersArray) {
        int temp = [value intValue];
        if (temp > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        if (temp < 0) {
            return @"Negative numbers are not valid for input.";
        }
        answer = [NSString stringWithFormat:@"%@%d", answer, temp];
        count++;
        if (count == 4) {
            return answer;
        }
        answer = [NSString stringWithFormat:@"%@%@", answer, @"."];
    }
    if (count == 1) {
        return [NSString stringWithFormat:@"%@%@", answer, @"0.0.0"];
    }
    if (count == 2) {
        return [NSString stringWithFormat:@"%@%@", answer, @"0.0"];
    }
    if (count == 3) {
        return [NSString stringWithFormat:@"%@%@", answer, @"0"];
    }
    return answer;
}

@end
