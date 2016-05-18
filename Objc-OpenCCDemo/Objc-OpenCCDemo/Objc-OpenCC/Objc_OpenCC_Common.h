//
//  Objc_OpenCC_Common.h
//  JyonTenx
//
//  Created by XiongMacAir on 14/11/15.
//
//


#include "opencc.h"
#include "OpenCCConverter.hpp"
typedef void* opencc_t;

extern  Opencc *CppOpenCCConverter;
extern  opencc_t openccSimToConvertr;
extern  opencc_t openccTradToConvertr;

#define OPENCC_BUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"OpenCC.bundle"]

#define OPENCC_BUNDLE [NSBundle bundleWithPath:OPENCC_BUNDLE_PATH]

//這兩個宏在 OpenCC 源碼的 opencc.h文件中也存在，如果要引入Objc_OpenCC,opencc.h中的這兩個宏務必註釋掉
//並且要在opencc.h中引入本Objc_OpenCC.h頭文件，或者在工程全局引入本頭文件
#define OPENCC_DEFAULT_CONFIG_SIMP_TO_TRAD  [[OPENCC_BUNDLE pathForResource:@"s2t" ofType:@"json"]UTF8String]

#define OPENCC_DEFAULT_CONFIG_TRAD_TO_SIMP [[OPENCC_BUNDLE pathForResource:@"t2s" ofType:@"json"]UTF8String]