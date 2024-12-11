#include <std/io.pat>
#include <std/mem.pat>
#pragma pattern_limit 0x20000

struct BGRA8 {
  u8 blue;
  u8 green;
  u8 red;
  u8 alpha;
} [[color(std::format("{:02X}{:02X}{:02X}", red, green, blue))]];

struct ELA_frame_t {
   BGRA8 colors[240];
};

struct ELA_data_t {
   char header[4];
   u32 unk_1;
   ELA_frame_t frames[parent.count];
};

struct ELA_unreal_frame_t {
  BGRA8 colors[240];
  if(std::mem::read_unsigned($ + 0x14, 1) != 0x45) padding[0x5E];
};

struct ELA_unreal_data_t {
  padding[0x4A]; 
  char header[4];
  padding[0x46];
  u32 count;
  padding[0x87];
  ELA_unreal_frame_t frames[count];
  padding[0x14];
  ELA_data_t raw_ela;
};

ELA_unreal_data_t ela_unreal @ 0x00;