#include "std/mem.pat"
#include "std/string.pat"

struct header_t {
    char signature[4];
    u32 version;
    u32 blocks;
};

struct color_t {
    u8 r;
    u8 g;
    u8 b;
} [[static, color(std::format("{:02X}{:02X}{:02X}", r, g, b))]];

struct frame_t {
    color_t colors[240] [[inline]];
};

struct frames_t {
    frame_t frames[while(!std::mem::eof())];
} [[inline]];


header_t header @ 0x00;
frames_t frames @ 0x10;