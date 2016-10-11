// This file is part of Red Pill
// A 3D OpenGL "Matrix" screensaver for Mac OS X
// Copyright (C) 2002, 2003 mathew <meta@pobox.com>
// Copyright (C) 2016 px3 <rr@rdsroot.net>
//
// Red Pill is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
// or visit <URL:http://www.fsf.org/>

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
