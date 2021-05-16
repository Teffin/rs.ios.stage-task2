#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    long i = 0;
    long j = 1;
    long repeatNumIndex = 0;
    bool needRepeat = false;
    
    long count = 0;
    long len = array.count;
    
    NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(compare:)];
    while ((j < len && i <= j) || needRepeat)
    {
        if (i == j)
        {
            j++;
        }
        else if ((j == len) && needRepeat)
        {
            i++;
            j = repeatNumIndex;
            needRepeat = false;
        }
        else
        {

            if (((j + 1) < len) &&
                ([sortedArray[j] intValue] == [sortedArray[j + 1] intValue]) && !needRepeat)
            {
                repeatNumIndex = j;
                needRepeat = true;
            }
            if ([number intValue] == ([sortedArray[j] intValue] - [sortedArray[i] intValue]))
            {
                if (([sortedArray[i] intValue] != [sortedArray[i + 1] intValue]) && !needRepeat)
                {
                    i++;
                }
                count++;
                j++;
            }
            else if ([number intValue] < ([sortedArray[j] intValue] - [sortedArray[i] intValue]))
            {
                i++;
            }
            else if ([number intValue] > ([sortedArray[j] intValue] - [sortedArray[i] intValue]))
            {
                if (needRepeat)
                {
                    j = repeatNumIndex;
                    needRepeat = false;
                }
                j++;
            }
        }
    }
    
    return (NSInteger)count;
}

@end
