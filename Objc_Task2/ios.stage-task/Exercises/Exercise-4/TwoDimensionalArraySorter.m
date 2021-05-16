#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {

    if (!array)
    {
        return @[];
    }
    bool isFirstInt = false;
    long len = array.count;
    bool isInt = false;
    NSMutableArray * returnValue = [[NSMutableArray alloc] init];
    NSMutableArray * returnValue1 = [[NSMutableArray alloc] init];

    long i = 0;
    while (i < len) {
        if (![array[i] isEqual:@[]])
        {
            if (![array[i] isKindOfClass:[NSArray class]])
            {
                return @[];
            }
            long lenSubArray = array[i].count;
            long j = 0;
            if (j < lenSubArray)
            {
                if ([array[i][j] isKindOfClass:[NSString class]])
                {
                    isInt = false;
                }
                else if ([array[i][j] isKindOfClass:[NSNumber class]])
                {
                    isInt = true;
                }
                else
                {
                    return @[];
                }
                if (i == 0)
                {
                    isFirstInt = isInt;
                }
            }

            while (j < lenSubArray)
            {
                if (!isInt)
                {
                    if ([array[i][j] isKindOfClass:[NSString class]])
                    {
                        [returnValue addObject:array[i][j]];
                    }
                    else
                    {
                        return @[];
                    }
                }
                else if (isInt)
                {
                    if ([array[i][j] isKindOfClass:[NSNumber class]])
                    {
                        [returnValue1 addObject:array[i][j]];
                    }
                    else
                    {
                        return @[];
                    }
                }
                j++;
            }
            
        }
        i++;
    }
    [returnValue1 sortUsingSelector:@selector(compare:)];
    if ((![returnValue  isEqual: @[]]) && (![returnValue1  isEqual: @[]]))
    {
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"" ascending:NO];
        NSArray *sortedArray=[returnValue sortedArrayUsingDescriptors:@[sort]];
        return @[returnValue1, sortedArray];
    }
    else if ([returnValue1  isEqual: @[]])
    {
        [returnValue sortUsingSelector:@selector(compare:)];
        return returnValue;
    }
    else
    {
        return returnValue1;
    }
}

@end
