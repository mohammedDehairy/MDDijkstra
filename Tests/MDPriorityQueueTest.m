//
//  MDPriorityQueueTest.m
//  MDDijkstra
//
//  Created by mohamed mohamed El Dehairy on 12/5/16.
//  Copyright © 2016 mohamed El Dehairy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MDPriorityQueue.h"

@interface MDPriorityQueueTest : XCTestCase

@end

@implementation MDPriorityQueueTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/*!
 @brief Assert that objects are successfully added to the heap, and the minimum object returned after addition is the correct one
 */
- (void)testAddObject {
    MDPriorityQueue<NSNumber*> *heap = [[MDPriorityQueue alloc] initWithComparatorBlock:^NSComparisonResult(NSNumber *num1,NSNumber *num2){
        return [num1 compare:num2];
    }];
    for(int i = 600;i >= 0; i--){
        NSNumber *number = [NSNumber numberWithInt:i];
        [heap addObject:number];
        NSNumber *minNumber = [heap peekMinObject];
        XCTAssertEqual(heap.count, 600-i+1);
        XCTAssertEqual(minNumber, number);
    }
}

/*!
 @brief Assert that the designated initializer returns nil instance if the passed comparator block is nil
 */
- (void)testNilComparatorBlock{
    MDPriorityQueueComparatorBlock comparatorBlock = nil;
    MDPriorityQueue *heap = [[MDPriorityQueue alloc] initWithComparatorBlock:comparatorBlock];
    XCTAssertNil(heap);
}

/*!
 @brief test that peekMinObject and removeMinObject return nil if the heap is empty
 */
- (void)testEmptyHeap{
    MDPriorityQueue *heap = [[MDPriorityQueue alloc] initWithComparatorBlock:^NSComparisonResult(id obj1,id obj2){
        return NSOrderedSame;
    }];
    XCTAssertNil([heap peekMinObject]);
    XCTAssertNil([heap removeMinObject]);
}

/*!
 @brief Assert that objects are successfully removed, and with the correct order according the comparactor block passed to the heap on initialization
 */
- (void)testRemoveMin{
    MDPriorityQueue<NSNumber*> *heap = [[MDPriorityQueue alloc] initWithComparatorBlock:^NSComparisonResult(NSNumber *num1,NSNumber *num2){
        return [num1 compare:num2];
    }];
    for(int i = 600;i >= 0; i--){
        NSNumber *number = [NSNumber numberWithInt:i];
        [heap addObject:number];
    }
    
    for(int i = 0;i <= 600; i++){
        NSNumber *number = [NSNumber numberWithInt:i];
        NSNumber *minNumber = [heap removeMinObject];
        XCTAssertTrue([number isEqualToNumber:minNumber]);
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


@end
