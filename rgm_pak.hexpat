#include <std/mem.pat>

struct header_t {
    u32 unknown1;
    u32 unknown2;
};

struct encoded_char_t {
    u8 index;
    u24 encoded [[transform("dec_char")]];
} [[format_read("show_char")]];

struct encoded_password_t {
    encoded_char_t chr[while (std::mem::read_unsigned($, 1) != 0x08)] [[inline]];
} [[format_read("pw_string")]];

fn dec(u32 enc) {
    return enc >> 4;
};

fn show_char(encoded_char_t chr) {
    return chr.encoded;
};

fn dec_char(u32 chr) {
    return char(dec(chr));
};

fn pw_string(encoded_password_t pw) {
    str password;
    
    for (u8 i = 0, i < 16, i = i + 1) {
        password += pw.chr[i].encoded; 
    }
    
    return password;
};

struct unknown1_t {
    u32 unknown1;
    u32 unknown2;
};

struct rgmpak_t {
    header_t header;
    encoded_password_t password;
    unknown1_t unknown1;
};

rgmpak_t rgm_pak @ 0x00;





