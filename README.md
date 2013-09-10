NSManagedObject+Unique
----------------------

This project is a "simple" abstract subclass of NSManagedObject to test objects to see if they are new entities or if similar entities exists.

At the moment it has a few limitations:

* Only one property can be used to test for uniqueness, at the moment this must be a string
* The objects are loaded (faulted) rather than just the unique ID value for each
* While it is multi-threaded, the search method does not return until the work is complete
* It has a obvious bottle neck in the of form a Lock around a mutable collection.

This is mainly a proof of concept, and a request for comments on how to improve the performance and the flexibility of the code.

Usage
-----

Firstly you need to override the uniqueKeyPath and entityName methods to refect the unique keypath of your managedObject and entityName respectively.

Then where ever you import data you will call this method:

	+ (NSArray *)allUniqueObjectsWith:(NSArray *)newObjects
	                    uniqueKeyPath:(NSString *)aKeypath
	             managedObjectContext:(NSManagedObjectContext *)aMoc
				 
 With an array of new objects you wish to import, and the keypath to the property of each of the imported objects that you wish to compare against your presected keypath with your managedObject.
 
 This method will return an NSArray of all of the objects that do not yet exist within the data store. 
 With this information you can then prompt the user to approve them, add them, or quite frankly do whatever you please.

License
-------

	Copyright (C) <2013> <Jonathan Dalrymple>

	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Author
------
Jonathan Dalrymple [email](mailto:jonathan@float-right.co.uk) [twitter](http://twitter.com/veritech)
