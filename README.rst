###########################
NYC Python CPython Workshop
###########################

Getting Started
###############

Here's everything you need to do to perform the exercises for this workshop
using your computer instead of on a remote virtual machine.

What You Need
+++++++++++++

- VirtualBox_
- Vagrant_ (`docs <http://docs.vagrantup.com/v2/>`_)
- PuTTY_ or another SSH client (Windows users only)

.. _PuTTY: http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
.. _Vagrant: http://downloads.vagrantup.com/
.. _VirtualBox: https://www.virtualbox.org/wiki/Downloads

.. note::

    PuTTY users may need to follow the directions on `Stack Overflow`_.

.. _Stack Overflow: http://stackoverflow.com/a/9924122/978961

Setup
+++++

After installing VirtualBox and Vagrant, clone the repository and start up the
virtual machine.

.. code:: sh

   $ git clone https://github.com/NYCPython/CPython-Workshop.git
   $ cd CPython-Workshop
   $ vagrant up

.. note::

   The last step may take some time if this is your first time using the
   ``saucy64`` Vagrant box.

Once these steps are complete, you can access the Vagrant box's command line
interface with:

.. code:: sh

   $ vagrant ssh

What To Do If You Have Wifi Problems
++++++++++++++++++++++++++++++++++++

There will be thumbdrives available containing the following:

- saucy64
- VirtualBox
- Vagrant

After installing VirtualBox and Vagrant, the ``saucy64`` Vagrant box can be
added manually.

.. code:: sh

   $ cd /path/to/dir_with_saucy64
   $ vagrant box add saucy64 saucy64.box
