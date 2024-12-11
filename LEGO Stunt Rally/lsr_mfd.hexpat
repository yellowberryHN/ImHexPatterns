struct meta_filetype_t {
    u32 id;
    u32 unk; // seems to always be 4
    u16 lenData;
    u16 numFields;
    char name[22];
    padding[3];
    u32 fields[numFields];
};

struct mfd_t {
    u32 type;
    u32 version;
    u32 numTypes;
    meta_filetype_t fileTypes[numTypes];
};

mfd_t mfd @ 0x00;
