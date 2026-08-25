#include "darts.h"
#include <math.h>

uint8_t score(coordinate_t landing_position){
    float dist = hypot(landing_position.x, landing_position.y);
    if (dist <= 1.0f) return 10;
    if (dist <= 5.0f) return 5;
    if (dist <= 10.0f) return 1;

    return 0;
}