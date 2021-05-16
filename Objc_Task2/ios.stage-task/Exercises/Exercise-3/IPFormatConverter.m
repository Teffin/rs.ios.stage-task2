#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSString * errorNegative = @"Negative numbers are not valid for input.";
    NSString * errorOverFlow = @"The numbers in the input array can be in the range from 0 to 255.";
    
    NSMutableString * returnValue = [[NSMutableString alloc] init];
   
    long len = numbersArray.count;
    
    if (!len)
    {
        return returnValue;
    }
    
    long lenIPv4 = 4;
    long i = 0;
    
    while(lenIPv4)
    {
        if (i < len)
        {
            if ([numbersArray[i] intValue] > 255)
            {
                return errorOverFlow;
            }
            else if ([numbersArray[i] intValue] < 0)
            {
                return errorNegative;
            }
            else
            {
                [returnValue appendFormat:@"%@", numbersArray[i]];
            }
            i++;
        }
        else
        {
            [returnValue appendFormat:@"%@", @"0"];
        }
        lenIPv4--;
        if (lenIPv4)
        {
            [returnValue appendFormat:@"%@", @"."];
        }
    }
    
    return returnValue;
}

@end
