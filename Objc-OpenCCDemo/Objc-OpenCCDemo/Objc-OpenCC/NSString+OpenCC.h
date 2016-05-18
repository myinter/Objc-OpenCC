//
//  NSString+OpenCC.h
//  JyonTenx
//
//  Created by XiongMacAir on 14/11/5.
//
//

#import <Foundation/Foundation.h>
#include "Objc_OpenCC.h"

@interface NSString (OpenCC)

//將簡體轉換為正體
-(NSString *)simpleToTrad;

//正體轉換為簡體
-(NSString *)tradToSimple;

//單個漢字轉換為對應的所有正體字(只能转一个字)
-(NSString *)convertSingleCharacterToTrad;

//將一個串內所有漢字轉換鄭對應正體字，按自己串內的順序拼接起來
-(NSString *)convertCharactersToTrad;

//將創建好的轉換器釋放（在不在打算使用本功能，打算節省內存的時候調用這個方法）
+(void)releaseOpenCCConveter;
@end
