//
//  NSObject+ALEXReaderWriterAccess.m
//  ALEXReaderWriterAccess
//
//  Created by Alexander Kempgen on 22.05.13.
//  Copyright (c) 2013 Alexander Kempgen. All rights reserved.
//

#import "NSObject+ALEXReaderWriterAccess.h"
#import <objc/runtime.h>

@implementation NSObject (ALEXReaderWriterAccess)

- (void)alex_performReadBlock:(dispatch_block_t)readBlock {
	dispatch_async([self alex_readerWriterAccessQueue], readBlock);
}

- (void)alex_performReadBlockAndWait:(dispatch_block_t)readBlock {
	dispatch_sync([self alex_readerWriterAccessQueue], readBlock);
}

- (void)alex_performWriteBlock:(dispatch_block_t)writeBlock {
	dispatch_barrier_async([self alex_readerWriterAccessQueue], writeBlock);
}

- (void)alex_performWriteBlockAndWait:(dispatch_block_t)writeBlock {
	dispatch_barrier_sync([self alex_readerWriterAccessQueue], writeBlock);
}

- (dispatch_queue_t)alex_readerWriterAccessQueue {
	static char ALEXReaderWriterAccessQueueKey = 0;
	dispatch_queue_t queue = objc_getAssociatedObject(self, &ALEXReaderWriterAccessQueueKey);
	if (!queue) {
		NSString *label = [@"alex.reader-writer-access.queue." stringByAppendingString:NSStringFromClass([self class])];
		queue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_CONCURRENT);
		objc_setAssociatedObject(self, &ALEXReaderWriterAccessQueueKey, queue, OBJC_ASSOCIATION_RETAIN);
	}
	return queue;
}

@end
