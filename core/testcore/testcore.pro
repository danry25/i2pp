#    this file is part of i2pp
#    Copyright (C)2009 Gilbert Jeiziner
#
#    This program is free software; you can redistribute it and/or
#    modify it under the terms of the GNU General Public License
#    as published by the Free Software Foundation; either
#    version 2 of the License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

TEMPLATE = app

QT += testlib network
QT -= gui

TARGET = testcore

CONFIG += console
CONFIG -= app_bundle

INCLUDEPATH +=  \
    ../src \
    ../include \
    ../../qtestext/include \
    ../../log4qt/src

LIBS += -L../lib/ \
    -L../../qtestext/lib/ \
    -lbotan

MOC_DIR = release
OBJECTS_DIR = release


CONFIG(release, debug|release){
    LIBS += -lqtestext \
        -li2pp-core
} else {
    LIBS += -lqtestextD \
        -li2pp-coreD
    DEFINES += DEBUG
    MOC_DIR = debug
    OBJECTS_DIR = debug

}

include(./time/time.pri)
include(./util/util.pri)

SOURCES += \
    main.cpp \
    runner.cpp \
    testcontext.cpp

HEADERS +=  \
    runner.h \
    testcontext.h

#run the tests after build
win32 {
    CONFIG(release, debug|release) {
        QMAKE_POST_LINK = ./release/testcore.exe
    } else {
        QMAKE_POST_LINK = ./debug/testcore.exe
    }
} else {
    QMAKE_POST_LINK = ./testcore
}
