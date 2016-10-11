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

#import <Foundation/Foundation.h>
#import <OpenGL/gl.h>

// This file contains a handy GL error checking function adapted from 
// the one found in the Apple OpenGL sample code.

// Note that __private_extern__ protects CheckGLError from conflicting
// with other screen saver modules, preference panes, frameworks,
// and other bundles that get loaded into the System Preferences
// application, and which have quite likely used the same function.
__private_extern__ void CheckGLError(const char *func, const char *note);
__private_extern__ void LogError(const char *func, const char *note);
