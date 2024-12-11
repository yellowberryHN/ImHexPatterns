#include <std/mem.pat>

struct block_t {
    char type[4];
    u32 length;
    u8 data[length-8];
};

struct tsunami_model_t {
   char type[4];
   u32 filesize;
   block_t block[while(!std::mem::eof())];
};

tsunami_model_t tsunami_model_t_at_0x00 @ 0x00;