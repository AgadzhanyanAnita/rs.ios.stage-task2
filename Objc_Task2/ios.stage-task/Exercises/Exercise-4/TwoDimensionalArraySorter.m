#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    //Если пусто, выводим пустой массив
    if (!array) {
            return @[];
        }
        
    NSMutableArray *stringArray = [NSMutableArray new];
    NSMutableArray *numbersArray = [NSMutableArray new];
    
    for (NSArray *i in array) {
        
        //Если массив одномерный, выводим пустой массив
        if (![i isKindOfClass:NSArray.class]) {
            return @[];
        }
        
        for (NSArray *j in i) {
            //Проверяем, чем является j. Строкой или числом
            if ([j isKindOfClass:NSString.class]) {
                [stringArray addObject:j];
            } else {
                [numbersArray addObject:j];
            }
            
        }
    }
    
    //Если массив из строк пустой, то сортируем и выводим массив из чисел
    if (stringArray.count == 0) {
        [numbersArray sortUsingSelector:@selector(compare:)];
        return numbersArray;
    }
    
    //Если массив из чисел пустой, то сортируем и выводим массив из строк
    if (numbersArray.count == 0) {
        [stringArray sortUsingSelector:@selector(compare:)];
        return stringArray;
    }
    
    [numbersArray sortUsingSelector:@selector(compare:)];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"self" ascending:NO];
    [stringArray sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    return [[NSArray alloc] initWithObjects:numbersArray, stringArray, nil];
}

@end
