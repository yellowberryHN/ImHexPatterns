struct Vector3D {
  float x, y, z;
};

enum MetadataType : u32 {
    Integer = 0,
    FloatingPoint = 1,
    Coordinates = 2,
    String = 3
};

struct meta_field_t {
    u32 id;
    MetadataType type;
    padding[4]; // idk
    char name[20];
    padding[1];
    char desc[0x100];
    
    if (type == MetadataType::FloatingPoint) {
        float defaultValue;
        float minValue;
        float maxValue;
        padding[0x18];
    } 
    else if (type == MetadataType::Integer) {
        u32 defaultValue;
        u32 minValue;
        u32 maxValue;
        padding[0x18];
    }
    else if (type == MetadataType::Coordinates) {
        Vector3D defaultValue;
        Vector3D minValue;
        Vector3D maxValue;
    }
    else {
        padding[12];
        padding[0x18];
    }
    
    padding[3];
};

struct mdd_t {
    padding[4];
    u32 version;
    u32 numFields;
    meta_field_t fields[numFields];
};

mdd_t mdd @ 0x00;
