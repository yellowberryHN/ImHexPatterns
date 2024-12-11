#include <std/mem.pat>

struct Vector3D {
  float x, y, z;
};

enum MetadataType : u32 {
    Integer = 0,
    FloatingPoint = 1,
    Coordinates = 2,
    String = 3
};

struct field_t {
    u32 id;
    MetadataType type; //string, int, float, whatever
    u32 len;
    if (type == MetadataType::Integer) {
        u32 data[len / sizeof(u32)];
    }
    else if (type == MetadataType::FloatingPoint) {
        float data[len / sizeof(float)];
    }
    else if (type == MetadataType::Coordinates) {
        Vector3D data[len / 12];;
    }
    else if (type == MetadataType::String) {
        char data[len];
    }
    else {
        char data[len];
    }
} [[format("field_format")]];

fn field_format(field_t value) {
    return value.type;
};

struct mdf_t {
    padding[0x14];
    u32 unk;
    u32 fileType;
    field_t fields[while(!std::mem::eof())];
};

mdf_t mdf @ 0x00;
