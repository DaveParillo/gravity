/** (C) Copyright 2013, Applied Physical Sciences Corp., A General Dynamics Company
 **
 ** Gravity is free software; you can redistribute it and/or modify
 ** it under the terms of the GNU Lesser General Public License as published by
 ** the Free Software Foundation; either version 3 of the License, or
 ** (at your option) any later version.
 **
 ** This program is distributed in the hope that it will be useful,
 ** but WITHOUT ANY WARRANTY; without even the implied warranty of
 ** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 ** GNU Lesser General Public License for more details.
 **
 ** You should have received a copy of the GNU Lesser General Public
 ** License along with this program;
 ** If not, see <http://www.gnu.org/licenses/>.
 **
 */


%include "std_string.i" // for std::string typemaps

%module(directors="1", naturalvar="1") gravity

%{
#include <iostream>
#include "GravityNode.h"
#include "FutureResponse.h"
//#include "CPPGravitySubscriber.h"
//#include "CPPGravityServiceProvider.h"
//#include "CPPGravityRequestor.h"
//#include "CPPGravityHeartbeatListener.h"
//#include "CPPGravityLogger.h"
//#include "CPPGravitySubscriptionMonitor.h"
using namespace std::tr1;
%}

//%include "modulecode.i"
//%include "logger.i"
%include "gravitynode.i"
