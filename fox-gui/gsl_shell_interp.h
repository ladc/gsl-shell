#ifndef GSL_SHELL_INTERP_H
#define GSL_SHELL_INTERP_H

extern "C" {
#include <lua.h>
}

#include "defs.h"
#include "pthreadpp.h"
#include "lua-gsl.h"
#include "strpp.h"

class gsl_shell : public gsl_shell_state {
public:
  enum eval_result_e { eval_success, eval_error, incomplete_input };

  gsl_shell() { gsl_shell_open(this); }
  ~gsl_shell() { }

  void init();
  void stop();
  int exec(const char* line);
  const char* error_msg() const { return m_error_msg; }

  void lock() { pthread_mutex_lock(this->exec_mutex); }
  void unlock() { pthread_mutex_unlock(this->exec_mutex); }

private:
  int error_report(int status);

  pthread::mutex m_eval;
  str m_error_msg;
};

#endif
