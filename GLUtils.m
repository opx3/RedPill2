#import <OpenGL/glu.h>
#import "GLUtils.h"

// The main change between this function and the Apple version is that
// this one counts the number of errors, and silently ignores errors
// after the first three.
// This is because some users discovered that RedPill would report GL
// errors *even when everything worked fine*, and their system log would
// get filled up with 30 lines of error text every second until it ate
// all available disk space. Ouch!

const char* get_gl_error_name(GLenum error)
{
    switch (error) {
      #define CASE(x) case x: return #x;
          CASE(GL_INVALID_ENUM)
          CASE(GL_INVALID_FRAMEBUFFER_OPERATION)
          CASE(GL_INVALID_OPERATION)
          CASE(GL_INVALID_VALUE)
          CASE(GL_NO_ERROR)
          CASE(GL_OUT_OF_MEMORY)
          CASE(GL_STACK_OVERFLOW)
          CASE(GL_STACK_UNDERFLOW)
      #undef CASE
          default:
              return NULL;
    }
}

__private_extern__ void CheckGLError(const char *func, const char *note)
{
  static int errcount = 0;

  GLenum error = glGetError();
  if (error)
  {
    if (errcount < 4) {
      errcount += 1;
      NSLog(@"%s.%s: %s (%d)", func, note, get_gl_error_name(error), error);
    }
  }
}

__private_extern__ void LogError(const char *func, const char *note)
{
  static int logcount = 0;
  
  if (logcount < 4) {
    logcount += 1;
    NSLog(@"%s: %s", func, note);
  }
}