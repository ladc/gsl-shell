#ifndef LUA_GSL_H
#define LUA_GSL_H

#include <pthread.h>

#include "defs.h"

__BEGIN_DECLS

#include <lua.h>

struct gsl_shell_state;

struct gsl_shell_class {
  int (*on_open)(struct gsl_shell_state*);
  int (*on_close)(struct gsl_shell_state*);
};

struct gsl_shell_state {
  struct gsl_shell_class *class;
  lua_State *L;
  pthread_mutex_t exec_mutex;
  pthread_mutex_t shutdown_mutex;
  int is_shutting_down;
};

extern void gsl_shell_open (struct gsl_shell_state *gs);
extern void gsl_shell_close (struct gsl_shell_state *gs);

extern int luaopen_gsl (lua_State *L);

__END_DECLS

#endif
