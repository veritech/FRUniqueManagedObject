Unique Category
-------------------------------

This project is a "simple" category on NSManagedObject to test objects to see if they are new entities or if similar entities exists.

At the moment it has a few limitations:

* Only one property can be used to test for uniqueness, at the moment this must be a string
* The objects are loaded (faulted) rather than just the unique ID value for each
* While it's multi-threaded the search method does not return until the work is complete
* It has a obvious bottle neck in the form a Lock around a mutable collection.

This is main a proof of concept, and a request for comments on how to improve the performance and the flexibility of the code.

License
-------

	Copyright (C) <2013> <Jonathan Dalrymple>

	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Author
------
Jonathan Dalrymple [email](jonathan@float-right.co.uk) [twitter](http://twitter.com/veritech)
