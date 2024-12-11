#include "std/io.pat"
#include "std/string.pat"

struct string_t {
    u32 len;
    char data[len];
};

struct mult_data { // multiplied data
    u32 x;
    u32 y;
    u8 data[x * y];
    u8 other_data[0x400];
} [[inline]];

struct string_data {
    u32 count;
    str string;
} [[inline]];

struct wave_data {
    u32 magic;
    u32 size;
    u8 data[size];
} [[inline]];

struct section_t {
    char name[4];
    u32 location;
    
    std::print("name: {}", name);
    
    match (name) {
        (_): mult_data data @ location;
        ("01SM" | "10SM" | "11SM" | "20SM" | "30SM" | "40SM" | "50SM" | "60SM" | "70SM" | "80SM" | "90SM" ): wave_data data @ location;
        ("LITJ" | "DMAC"): u32 idk @ location;
        //(_): string_data data @ location;
    }
     
    //string_t strings[count] @ location + sizeof(location);
};

struct header_t {
    u32 sections;
    section_t section[sections];
};

header_t header @ 0x00;