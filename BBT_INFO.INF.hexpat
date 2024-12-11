#include "std/io.pat"

struct string_t {
    u32 len;
    char data[len];
};

struct section_t {
    char name[4];
    u32 location;
    
    u32 count @ location;
    string_t strings[count] @ location + sizeof(location);
};

struct header_t {
    u32 sections;
    section_t section[sections];
};

header_t header @ 0x00;