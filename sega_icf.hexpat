struct time_t {
    u16 year;
    u8 month;
    u8 day;
    u8 hour;
    u8 minute;
    u8 second;
    u8 millis;
};

struct icf_container_t {
    u16 sig;
    padding[2];
    u32 index;
    padding[0x18];
    u32 thing;
    time_t time;
    u32 other_thing;
    padding[0x10];
};

struct icf_file_t {
    u32 crc;
    u32 size;
    padding[8];
    u32 count;
    padding[4];
    char game[4];
    char hardware[3];
    padding[1];
    u32 other_crc;
    padding[0x1C];
    icf_container_t containers[count];
};

icf_file_t icf @ 0x00;