//
//  NSString+getArrayOfChars.m
//  JyonTenx
//
//  Created by XiongMacAir on 14/11/15.
//
//

#import "NSString+getArrayOfChars.h"

@implementation NSString (getArrayOfChars)

-(NSArray *)toArrayOfChars
{
    int length =  self.length;
    NSMutableArray *outPutArray = [NSMutableArray new];
    for (int i=0; i<length; ++i)
    {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [self substringWithRange:range];
        [outPutArray addObject:subString];
    }
    return outPutArray;
}
@end
