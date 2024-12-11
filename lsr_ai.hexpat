struct ai_t {
    padding[4];
    u16 racingLine;
    u16 braking;
    u16 overtaking;
    u16 speed;
    u16 reflex;
    padding[2];
    u8 blocking;
    u8 cutsCorners;
    u8 intelligence;
    u8 craziness;
};

ai_t ai @ 0x00;
