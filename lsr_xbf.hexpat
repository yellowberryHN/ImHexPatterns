struct Vector2D {
  float x, y;
};

struct Vector3D {
  float x, y, z;
};

struct mesh_vertex_t {
    Vector3D vector;
    Vector3D normal;
};

struct mesh_index_t {
   u32 a, b, c;
   u32 textureId;
   u32 e;
   Vector2D uv1;
   Vector2D uv2;
   Vector2D uv3;
};  

struct submesh_t {
    u32 numVerts;
    u32 unk1;
    u32 numIndices;
    u32 numSubMeshes;
    padding[128]; // probably has useful data in it.
    u32 lenName;
    char name[lenName];
    mesh_vertex_t verts[numVerts];
    mesh_index_t indices[numIndices];
    padding[numIndices * 4];
    u32 unk2;
};

struct mesh_t {
    u32 numVerts;
    u32 unk1;
    u32 numIndices;
    u32 numSubMeshes;
    padding[128]; // probably has useful data in it.
    u32 lenName;
    char name[lenName];
    submesh_t submeshes[numSubMeshes]; // submeshes would go here
    mesh_vertex_t verts[numVerts];
    mesh_index_t indices[numIndices];
    padding[numIndices * 4];
    u32 unk2;
};

struct xbf_t {
    u32 version;
    padding[4];
    u32 lenTextures;
    char textures[lenTextures]; // split this into an array somehow
    mesh_t mesh;
};

xbf_t xbf @ 0x00;
