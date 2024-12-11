struct asset_t {
    u32 id;
    padding[4];
    char path[];
    padding[3];
} [[single_color]];

struct data_path_t {
    char path[];
    padding[215];
} [[inline]];

struct rtb_t {
    char identifier[];
    padding[1];
    u32 assetCount;
    data_path_t paths[4];
    asset_t assets[assetCount];
};

rtb_t rtb @ 0x00;
