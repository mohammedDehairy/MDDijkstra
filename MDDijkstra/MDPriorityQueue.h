//
//  MDMinHeap.h
//  MDDijkstra
//
//  Created by mohamed mohamed El Dehairy on 12/4/16.
//  Copyright © 2016 mohamed El Dehairy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSComparisonResult (^MDPriorityQueueComparatorBlock)(id obj1,id obj2);

/*!
    @class MDMinHeap
    
    @brief MDMinHeap is an Objective C implementation of a priority queue
 */
@interface MDPriorityQueue<ObjectType> : NSObject
/*!
    @brief A property to inspect how many objects currently in the heap
 */
@property(nonatomic,assign,readonly)NSUInteger count;
/*!
    @brief The designated initializer 
 
    @param comparatorBlock : a block that takes two objects and return NSComparisonResult
 
    @warning This initializer will return nil if comparatorBlock parameter is nil, so check if the returned MDMinHeap instance is not nil before using it
 */
-(nullable instancetype)initWithComparatorBlock:(MDPriorityQueueComparatorBlock)comparatorBlock NS_DESIGNATED_INITIALIZER;
-(instancetype)init NS_UNAVAILABLE;
/*!
    @brief Add an object to the heap
 
    @param object : the object to be added to the heap
 */
-(void)addObject:(ObjectType)object;
/*!
    @brief returns the currently minimum object in the heap, without removing it !
 
    @return returns the currently minimum object in the heap, without removing it !
 
    @warning The returned object will be nil if the heap is empty
 */
-(nullable ObjectType)peekMinObject;
/*!
    @brief returns the currently minimum object in the heap, after removing it !
 
    @return returns the currently minimum object in the heap, after removing it !
 
    @warning The returned object will be nil if the heap is empty
 */
-(nullable ObjectType)removeMinObject;
@end

NS_ASSUME_NONNULL_END
