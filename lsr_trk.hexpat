enum TrkSize : u32 {
    Multiplayer = 0,
    Singleplayer = 1
};

enum TrkTheme : u32 {
    Jungle = 0,
    Arctic = 1,
    Desert = 2,
    City = 3
};

enum TrkTime : u32 {
    Day = 0,
    Night = 1
};

struct header_t {
    char magic[12];
    u32 version;
    u32 filesize;
    TrkSize size;
    TrkTheme theme;
    TrkTime time;
};

enum TileRotation : u32 {
    West = 0,
    North = 1,
    East = 2,
    South = 3
};

struct tile_t {
    u32 unknown;
    float height;
    u32 resourceId;
    TileRotation rotation;
};

u32 trackTiles;

struct track_t {
    trackTiles = (parent.header.size == TrkSize::Singleplayer ? 64 : 256);
    tile_t tile[trackTiles] [[inline]];
};

enum Playable : u32 {
    Incomplete = 0,
    Complete = 1
};

struct footer_t {
    u32 unknown;
    Playable track_playable;
};

struct trk_t {
    header_t header;
    track_t track;
    footer_t footer;
};

trk_t trk @ 0x00;

