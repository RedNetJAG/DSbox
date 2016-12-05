#!/usr/bin/env bash

echo "# install java"
JAVA_JDK=openjdk-8-jdk
HOME=/home/vagrant
BASHRC=$HOME/.bashrc
JAVA_DIR=/usr/lib/jvm/java-8-openjdk-i684
SYSTEM=`uname -m`

if [ "$SYSTEM" == "x86_64" ]; then
  JAVA_DIR=/usr/lib/jvm/java-8-openjdk-amd64
fi

sudo apt-get -y install "$JAVA_JDK" libjansi-java

export JAVA_HOME=$JAVA_DIR

#if ! [ "$JAVA_HOME" ]; then
if ! grep -q 'export JAVA_HOME' $BASHRC; then
  echo "export JAVA_HOME=$JAVA_HOME" >> $BASHRC
fi

echo "# install python"
sudo apt-get -y install build-essential python-pip python-dev python3-pip python3-dev libzmq3 libzmq3-dev
#libfreetype6-dev libxft-dev

TEMP_DIR=/tmp

echo "# install scala 2.11"
wget -q -P $TEMP_DIR -c www.scala-lang.org/files/archive/scala-2.11.8.deb
sudo dpkg -i $TEMP_DIR/scala-2.11.8.deb
rm $TEMP_DIR/scala-2.11.8.deb
