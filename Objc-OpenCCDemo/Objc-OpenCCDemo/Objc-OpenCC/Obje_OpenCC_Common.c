//
//  Obje_OpenCC_Common.c
//  JyonTenx
//
//  Created by HiungMacMini on 2015/5/13.
//
//

#include <stdio.h>
#include "Objc_OpenCC_Common.h"
#include "opencc.h"
#include "OpenCCConverter.hpp"

Opencc *CppOpenCCConverter = NULL;
opencc_t openccSimToConvertr = NULL;
opencc_t openccTradToConvertr = NULL;
