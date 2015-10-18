vim
===
Personal vim config files.

Inspired by `lxyu <https://github.com/lxyu/vim>`_.


INSTALL
-------
It may cost a long time to install plugin.

.. code:: bash

	curl -L https://raw.githubusercontent.com/joest67/vim/master/install.sh | bash

.. _extra_install:

EXTRA INSTALL
-------
If you want use `ropevim <https://github.com/python-rope/ropevim>`_ or `YouCompleteMe <https://github.com/Valloric/YouCompleteMe>`_, you may follow this installing phrase:

ropevim
^^^^^^^

.. code:: bash

    $ cd $HOME/.vim/bundle/ropevim; python setup.py install

YouCompleteMe
^^^^^^^^^^^^^

.. code:: bash

    $ cd $HOME/.vim/bundle/YouCompleteMe
    $ git submodule update --init --recursive
    $ ./install.py --clang-completer


UPDATE
------

.. code:: bash

	$ cd $HOME/._vim
	$ make update

QA
--

1. ImportError: No module named ropevim

   Install ropevim => `extra_install`_

2. File "build/bdist.linux-x86_64/egg/ropemode/decorators.py", line 3, in <module> ImportError: No module named rope.base

   Update ropemode with pip

3. ycm_client_support.[so|pyd|dll] and ycm_core.[so|pyd|dll] not detected; you need to compile YCM before using it. Read the docs!

   Compile ycm => `extra_install`_

4. Other

   Google it.
