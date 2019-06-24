#!/bin/bash
#** (C) Copyright 2019, Applied Physical Sciences Corp., A General Dynamics Company
#**
#** Gravity is free software; you can redistribute it and/or modify
#** it under the terms of the GNU Lesser General Public License as published by
#** the Free Software Foundation; either version 3 of the License, or
#** (at your option) any later version.
#**
#** This program is distributed in the hope that it will be useful,
#** but WITHOUT ANY WARRANTY; without even the implied warranty of
#** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#** GNU Lesser General Public License for more details.
#**
#** You should have received a copy of the GNU Lesser General Public
#** License along with this program;
#** If not, see <http://www.gnu.org/licenses/>.
#**


# Tool-related substitution variables
PROTOBUF_LIB_DIR=${PROTOBUF_LIBRARY_PATH}
ZMQ_LIB_DIR=${ZeroMQ_LIBRARY_PATH}

export PATH=$PATH:${ServiceDirectory_BINARY_DIR}:${Archiver_BINARY_DIR}:${Playback_BINARY_DIR}
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${libgravity_BINARY_DIR}:${libkeyvalue_parser_BINARY_DIR}:$ZMQ_LIB_DIR:$PROTOBUF_LIB_DIR

cleanup()
# run if user hits control-c
{ 
  if [ ! -x $SDPID ]; then
    kill -9 $SDPID
  fi
  if [ ! -x $FAPID ]; then
    kill -9 $FAPID
  fi
  if [ ! -x $FRPID ]; then
    kill -9 $FRPID
  fi
  if [ ! -x $ATPID ]; then
    kill -9 $ATPID
  fi
  if [ ! -x $RTPID ]; then
    kill -9 $RTPID
  fi
  exit $?
}

# trap keyboard interrupt (control-c)
trap cleanup SIGINT

ServiceDirectory &
SDPID=$!

##
# Start the Archiver and the ArchiveTest and run them for a few seconds.  This will
# put a few BasicCounterDataProduct data products into a file called archive.bin.  Every
# 5 seconds, ArchiveTest will toggle the suspend flag on the Archiver.  This means
# that only about half of the published counter values will be archived.
##
Archiver &
FAPID=$!
./ArchiveTest &
ATPID=$!

sleep 20

kill $ATPID $FAPID
ATPID=
FAPID=
echo Killed ArchiveTest
sleep 1

##
# Now start ReplayTest and FileReplay.  Playback will read and publish the values in archive.bin.
# ReplayTest sees those data products, and prints a message.  Note the 5 second gaps caused by suspending FileArchiver, 
# and that the messages that were archived are still published once a second - just like ArchiveTest did originally.
##
echo Starting ReplayTest
./ReplayTest &
RTPID=$!
Playback &
FRPID=$!

sleep 20

cleanup

