/*  this file is part of i2pp
    Copyright (C)2009 Gilbert Jeiziner

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*/

#include "context.h"
#include "runner.h"
#include <QTimer>
#include <iostream>

#include <botan/botan.h>

/* Note: we have to initialize botan in the final application. It doesn't
   work in the static library as a global and/or static
*/
Botan::LibraryInitializer init;

int main(int argc, char *argv[])
{
    i2pp::core::ContextProvider provider;
    QCoreApplication app(argc,argv);
    Runner runner(&app);
    QTimer::singleShot(1, &runner, SLOT(run()));
    app.exec();
    return runner.getRetVal();
}
