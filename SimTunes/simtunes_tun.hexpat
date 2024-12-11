#include <std/string.pat>

struct backdrop_t {
  u32 unk3_len;
  u8 unk3a[0x10];
  std::string::SizedString<u32> backdrop;
};

struct color_info {
  s8 len;
  if(len > 0) {
    u8 colors[len];
  } else {
    padding[1];
  }
};


struct color_data_t {
  u32 len;
  color_info info[248];
  //u8 data[len];
};

struct other_data_t {
  u32 len;
  color_info info[0x84];
};

struct SimTunes_TUN {
  char header[4];
  std::string::SizedString<u32> name;
  padding[4];
  u32 unk1_len;
  u8 unk1[unk1_len];
  std::string::SizedString<u32> artist;
  std::string::SizedString<u32> comment; 
  u32 unk2_len;
  u32 unk2;
  backdrop_t backdrop; 
  u32 unk3[9]; // weird numbers?
  u8 unk4[0x400]; // 1024 bytes of FF
  color_data_t color_data;
  //other_data_t other_data;
};


SimTunes_TUN tun @ 0x00;