#!/bin/bash

export PATH=$PATH:../../../ThirdParty/bin:../../../src/api/java:../../../src/components/cpp/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../../../ThirdParty/lib:../../../src/api/cpp

ServiceDirectory &
SDPID=$!
java -cp build:../../../ThirdParty/protobuf-2.4.1/java/target/protobuf-java-2.4.1.jar:../../../src/api/java/gravity.jar -Djava.library.path=../../../ThirdParty/bin:../../../ThirdParty/lib:../../../src/api/java BasicServiceProvider &
JDPPID=$!

# sleep for a second to give the publisher a chance to register its data product
sleep 1

java -cp build:../../../ThirdParty/protobuf-2.4.1/java/target/protobuf-java-2.4.1.jar:../../../src/api/java/gravity.jar -Djava.library.path=../../../ThirdParty/bin:../../../ThirdParty/lib:../../../src/api/java BasicServiceRequestor

kill $SDPID
kill $JDPPID