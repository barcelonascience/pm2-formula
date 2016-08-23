=====
pm2
=====

Formula to install PM2 and setup apps via pillar.


.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``pm2``
-------

Runs the states to install PM2, bootstrap startup script, start apps and save processes.

``pm2.install``
---------------

Install PM2.

``pm2.startup``
---------------

Create script to auto ressurect PM2 apps at startup time.

``pm2.start``
-------------

Starts PM2 apps defined in the pillar.

``pm2.delete``
--------------

Deletes PM2 apps defined as 'absent' in the pillar.

``pm2.save``
------------

Save PM2 current process list. Uses startup script 'home_path' if defined.
