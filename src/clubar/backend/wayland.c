#include <clubar/core.h>

#define UNIMPLEMENTED die("Wayland currently not supported.\n")

void clu_setup(void) { UNIMPLEMENTED; }
void clu_clear(__attribute__((unused)) BlockType _) { UNIMPLEMENTED; }
void clu_render(__attribute__((unused)) BlockType _) { UNIMPLEMENTED; }
void clu_toggle_visibility() { UNIMPLEMENTED; }
clu_event_t clu_nextevent(__attribute__((unused)) char _[]) { UNIMPLEMENTED; }
void clu_cleanup(void) { UNIMPLEMENTED; }
