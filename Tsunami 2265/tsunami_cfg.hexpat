struct control_t {
   // inputs stored as scancodes, not virtual keycodes
   // arrow keys are scan code 2
  u32 main;
  u32 alt;
};

struct res_t {
  u32 width;
  u32 height;
  u32 depth;
};

struct tsunami_cfg_t {
  u32 header;
  u32 saves[6];
  u32 last_save_file_maybe;
  float snd_music_volume;
  float snd_sfx_volume;
  float snd_voice_volume;
  u32 snd_3d_amount;
  control_t up_btn;
  control_t down_btn;
  control_t left_btn;
  control_t right_btn;
  control_t jump_btn;
  control_t action1_btn;
  control_t action2_btn;
  control_t walk_btn;
  float mouse_speed;
  res_t resolution;
  u32 subtitles;
  u32 tex_filtering;
  u32 cartoon;
  u32 tex_detail; // 1-8
  u32 tex_res;
  u32 snd_music_toggle;
  u32 snd_sfx_toggle;
  u32 snd_voice_toggle;
  u32 snd_channels; // headphones = 0 , mono = 1, quad = 2, stereo = 3, surround = 4
};


tsunami_cfg_t tsunami_cfg_t_at_0x00 @ 0x00;