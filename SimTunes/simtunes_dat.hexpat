#include <std/string.pat>

fn string_table_pointer_base(u16 pointer) {
    // get offset to the end of string table
    return ((sizeof(parent.parent)+2)*parent.parent.parent.numStrings)+4;
};

struct st_string_t {
    padding[0x02];
    u16 id;
    u16 length;
    char *string[length] : u16 [[pointer_base("string_table_pointer_base")]];
};


fn st_string_format(auto thing) {
    str yeah = thing.string;
    return yeah;
};


struct simtunes_t {
    u16 numStrings;
    st_string_t strings[numStrings] [[format_read_entries("st_string_format")]];
};

simtunes_t simtunes @ 0x00;