#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 num = 0;
    int count = 8;
    while (count--)
    {
        num = (num << 1) | (n & 1);
        n >>= 1;
    }
    
    return num;
}
