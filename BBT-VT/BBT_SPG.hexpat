struct text_block_t {
    char data[128];
};

struct header_t {
    u32 magic;
    u32 unk1;
    u32 unk2;
    u32 unk3;
    text_block_t info[6];
};

struct file_data_t {
    u32 size;
    u8 data[size] [[sealed]];
    u32 pad;
};

struct folder_t {
    u32 file_count;
    text_block_t folder_name;
    text_block_t file_names[file_count];
};

struct package_t {
    u32 folder_count;
    folder_t folders[folder_count];
};


header_t header @ 0x00;
package_t package @ 0x310;

for (u8 i = 0, i < package.folder_count, i = i + 1) {
    for (u8 j = 0, j < package.folders[i].file_count, j = j + 1) {
        file_data_t file @ $;
    }
}