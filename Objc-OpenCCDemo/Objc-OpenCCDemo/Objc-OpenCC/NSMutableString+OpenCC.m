//
//  NSMutableString+OpenCC.m
//  JyonTenx
//
//  Created by XiongMacAir on 14/11/5.
//
//

#import "NSMutableString+OpenCC.h"

//#import "Objc_OpenCC_Common.h"

extern Opencc *CppOpenCCConverter;
extern opencc_t openccSimToConvertr;
extern opencc_t openccTradToConvertr;

void split(std::string& s, std::string& delim,std::vector< std::string >* ret);

@implementation NSMutableString (OpenCC)
+(void)releaseOpenCCConveter
{
    
    if (CppOpenCCConverter) {
        delete CppOpenCCConverter;
        CppOpenCCConverter = NULL;
    }
    
    
    if (openccSimToConvertr) {
        opencc_close(openccSimToConvertr);
        openccSimToConvertr = NULL;
    }
    
    if (openccTradToConvertr) {
        opencc_close(openccTradToConvertr);
        openccTradToConvertr = NULL;
    }
}

-(NSString *)simpleToTrad
{
    const char *input = [self UTF8String];
    
    
    if (openccSimToConvertr == NULL) {
        openccSimToConvertr = opencc_open(NULL);
    }
    
    
    char *output = opencc_convert_utf8(openccSimToConvertr, input, strlen(input));
    
    NSString *resultString = [NSString stringWithUTF8String:output];
    
    delete output;
    
    return resultString;
}


-(NSString *)tradToSimple
{
    const char *input = [self UTF8String];
    
    
    if (openccTradToConvertr == NULL) {
        openccTradToConvertr = opencc_open(OPENCC_DEFAULT_CONFIG_TRAD_TO_SIMP);
    }
    
    char *output = opencc_convert_utf8(openccTradToConvertr, input, strlen(input));
    
    
    NSString *resultString = [NSString stringWithUTF8String:output];
    
    free(output);
    
    return resultString;
}

//單個漢字轉換為對應的所有正體字(只能转一个字)
-(NSString *)convertSingleCharacterToTrad
{
    Opencc *converter;
    if (CppOpenCCConverter == NULL) {
        CppOpenCCConverter = new Opencc(OPENCC_DEFAULT_CONFIG_SIMP_TO_TRAD);
    }
    
    converter = CppOpenCCConverter;
    
    
//    vector<string> *inputChars = new vector<string>;
    
    
    //存放結果用的的

    vector<string> *outPutChars = new vector<string>;
    
    const char *input = [self UTF8String];
    
    string inputString = input;
    
    string dlim = "";
    
    
    converter->ConvertSingleCharacter(input, outPutChars);
    
    vector<string>::iterator end = outPutChars->end();
    
    string output;
    
    
    int count = 0;
    
    for (vector<string>::iterator i=outPutChars->begin(); i != end; ++i,count++) {
        //遍歷結果，拼接字符串
        
        
            output += *i;
    }
    
    
    NSString *resultString = [NSString stringWithUTF8String:output.data()];
    
    delete outPutChars;
    
    NSLog(@"resultString = %@",resultString);
    
    return resultString;
}


//串内所有汉字转换成对应的正体字，并拼接成串。。
-(NSString *)convertCharactersToTrad
{
    NSMutableString *resultstring = [NSMutableString new];
    
    NSInteger length = self.length;
    
    for (NSInteger count=0; count < length ; count++) {
        
        NSString *character = [self substringWithRange:NSMakeRange(count, 1)];
        
        
        NSString *output = [character convertSingleCharacterToTrad];
        
        
        if (output.length) {
            [resultstring appendString:output];
        }
        else
        {
            [resultstring appendString:character];
        }
    }
    return resultstring;
}

void split(std::string& s, std::string& delim,std::vector< std::string >* ret)
{
    size_t last = 0;
    size_t index=s.find_first_of(delim,last);
    while (index!=std::string::npos)
    {
        ret->push_back(s.substr(last,index-last));
        last=index+1;
        index=s.find_first_of(delim,last);
    }
    if (index-last>0)
    {
        ret->push_back(s.substr(last,index-last));
    }
}

@end
