struct frame_t {
    u8 data[parent.width * parent.height * (parent.bitDepth / 8)];
};

struct mvd_t {
    char header[20];
    u32 numFrames;
    u32 width;
    u32 height;
    u32 bitDepth;
    frame_t frames[numFrames];
};

mvd_t mvd @ 0x00;
