

:Author: 	Tom Hebbron
:Version: 	1.0 (first public release)
:Date:	 	2013-11-05



bitstring_helpers extension for PostgreSQL
==========================================



This small extension module provides a few useful functions and casts for working with bit strings (i.e., bit varying) in PostgreSQL. They scratch a small but specific itch - perhaps they will be useful.


Installation
------------

You will need the PostgreSQL development environment installed:

::

	apt-get install postgresql-server-dev

Then, to build and install, do:

::

	make
	sudo make install
	psql -d <database> -c "CREATE EXTENSION bitstring_helpers"


OK, great, here's what you get.

Functions
---------



shuffled_ints
~~~~~~~~~~~~~

::

	shuffled_ints(bigint) RETURNS bigint[] 

Create an array of user definable size *n* of shuffled integers (1 to *n*)

popcount
~~~~~~~~

::

    popcount(bit varying) RETURNS int 

Count the number of 1s in a bitstring

hamming_distance
~~~~~~~~~~~~~~~~

::

    hamming_distance(bit varying, bit varying) RETURNS int

Calculate the hamming distance between two bit varying bitstrings (must both be the same length).

neighbours
~~~~~~~~~~

::

    neighbours(bit varying) RETURNS SETOF bit varying 

Return all the 1-bit mutation neighbours of the given bitstring.



Casts 
-----


text2bitstring
~~~~~~~~~~~~~~

::
    
    text2bitstring(text) RETURNS bit varying 

Convert text (contianing 1's and 0's only) to a bit varying type.


bit2text
~~~~~~~~

::

    bit2text(bit varying) RETURNS text

Convert bit varying to text



Aggregates
----------

aconcat
~~~~~~~

Concatenates elements from arrays of any type into a single array.


concat (text or bit)
~~~~~~~~~~~~~~~~~~~~

Two aggregates for bits and for text - both concatenate elements into one long string (text) or bit varying (bits).


-------------------


*That's all folks.*