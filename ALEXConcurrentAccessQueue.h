//
//  ALEXConcurrentAccessQueue.h
//  ALEXConcurrentAccessQueue
//
//  Created by Alexander Kempgen on 25.05.13.
//  Copyright (c) 2013 Alexander Kempgen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALEXConcurrentAccessQueue : NSObject

@property(nonatomic, strong, readonly) dispatch_queue_t dispatchQueue;

- (id)init;
- (id)initWithName:(NSString *)name;

- (void)performReadBlock:(dispatch_block_t)readBlock;
- (void)performReadBlockAndWait:(dispatch_block_t)readBlock;
- (void)performWriteBlock:(dispatch_block_t)writeBlock;
- (void)performWriteBlockAndWait:(dispatch_block_t)writeBlock;

@end
