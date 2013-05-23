ALEXReaderWriterAccess
======================

An Objective-C category on NSObject that allows concurrent access to a mutable object from different queues. It adds methods like `-alex_performReadBlock:` and `alex_performWriteBlock:` that are used the same way to access the object as the similar methods on NSManagedObjectContexts of a queue concurrency type.

API
---

	- (void)alex_performReadBlock:(dispatch_block_t)readBlock;
	- (void)alex_performReadBlockAndWait:(dispatch_block_t)readBlock;
	- (void)alex_performWriteBlock:(dispatch_block_t)writeBlock;
	- (void)alex_performWriteBlockAndWait:(dispatch_block_t)writeBlock;

License
-------

3-clause BSD license:

	Copyright © 2013, Alexander Kempgen (https://github.com/akempgen)
	All rights reserved.
	
	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are met:
    	* Redistributions of source code must retain the above copyright
    	  notice, this list of conditions and the following disclaimer.
    	* Redistributions in binary form must reproduce the above copyright
    	  notice, this list of conditions and the following disclaimer in the
    	  documentation and/or other materials provided with the distribution.
    	* Neither the name of the copyright holder nor the
    	  names of its contributors may be used to endorse or promote products
    	  derived from this software without specific prior written permission.
	
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS "AS IS" AND
	ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
	DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
	DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
	(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
	LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
	ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
	(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
	SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

