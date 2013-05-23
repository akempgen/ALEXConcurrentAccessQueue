//
//  NSObject+ALEXReaderWriterAccess.h
//  ALEXReaderWriterAccess
//
//  Created by Alexander Kempgen on 22.05.13.
//  Copyright (c) 2013 Alexander Kempgen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ALEXReaderWriterAccess)

- (void)alex_performReadBlock:(dispatch_block_t)readBlock;
- (void)alex_performReadBlockAndWait:(dispatch_block_t)readBlock;
- (void)alex_performWriteBlock:(dispatch_block_t)writeBlock;
- (void)alex_performWriteBlockAndWait:(dispatch_block_t)writeBlock;

@end
