//
//  OpenCCConverter.h
//  JyonTenx
//
//  Created by XiongMacAir on 14/11/5.
//
//

#ifndef __JyonTenx__OpenCCConverter__
#define __JyonTenx__OpenCCConverter__

#include <stdio.h>
#include <string>
#include <vector>
#include "Config.hpp"
#include "Converter.hpp"
#include "Conversion.hpp"
#include "ConversionChain.hpp"
#include "Dict.hpp"
#include "DictEntry.hpp"


class Opencc {
public:
    Opencc(const std::string& config_path) {
//        std::cout<<"initilizing opencc:"<<config_path;
        opencc::Config config;
        converter_ = config.NewFromFile(config_path);
        const std::list<opencc::ConversionPtr> conversions =
        converter_->GetConversionChain()->GetConversions();
        dict_ = conversions.front()->GetDict();
    }
    
    
    ~Opencc()
    {
        
    }
    
    bool ConvertSingleCharacter(const std::string& text,
                                std::vector<std::string>* forms) {
        opencc::Optional<const opencc::DictEntry*> item = dict_->Match(text);
        if (item.IsNull()) {
            // Match not found
            return false;
        } else {
            const opencc::DictEntry* entry = item.Get();
            for (const char* value : entry->Values()) {
                forms->push_back(value);
            }
            return true;
        }
    }
    
    bool ConvertText(const std::string& text,
                     std::string* simplified) {
        *simplified = converter_->Convert(text);
        return true;
    }
    
private:
    opencc::ConverterPtr converter_;
    opencc::DictPtr dict_;
};

#endif /* defined(__JyonTenx__OpenCCConverter__) */
