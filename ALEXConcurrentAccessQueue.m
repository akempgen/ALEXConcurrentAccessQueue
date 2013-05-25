//
//  ALEXConcurrentAccessQueue.m
//  ALEXConcurrentAccessQueue
//
//  Created by Alexander Kempgen on 25.05.13.
//  Copyright (c) 2013 Alexander Kempgen. All rights reserved.
//

#import "ALEXConcurrentAccessQueue.h"

@implementation ALEXConcurrentAccessQueue

- (id)init {
    NSString *name = @"alex.concurrent-lock.access-queue";
    return [self initWithName:name];
}

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        dispatch_queue_t dispatchQueue = dispatch_queue_create([name UTF8String], DISPATCH_QUEUE_CONCURRENT);
        _dispatchQueue = dispatchQueue;
    }
    return self;
}

- (void)performReadBlock:(dispatch_block_t)readBlock {
    dispatch_async(self.dispatchQueue, readBlock);
}

- (void)performReadBlockAndWait:(dispatch_block_t)readBlock {
    dispatch_sync(self.dispatchQueue, readBlock);
}

- (void)performWriteBlock:(dispatch_block_t)writeBlock {
    dispatch_barrier_async(self.dispatchQueue, writeBlock);
}

- (void)performWriteBlockAndWait:(dispatch_block_t)writeBlock {
    dispatch_barrier_sync(self.dispatchQueue, writeBlock);
}

@end
