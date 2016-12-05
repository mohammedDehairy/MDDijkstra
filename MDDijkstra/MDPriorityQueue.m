//
//  MDMinHeap.m
//  MDDijkstra
//
//  Created by mohamed mohamed El Dehairy on 12/4/16.
//  Copyright © 2016 mohamed El Dehairy. All rights reserved.
//

#import "MDPriorityQueue.h"

@interface MDPriorityQueue ()
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,copy)MDPriorityQueueComparatorBlock comparatorBlock;
@end

@implementation MDPriorityQueue
-(instancetype)initWithComparatorBlock:(MDPriorityQueueComparatorBlock)comparatorBlock{
    if(self = [super init]){
        if(!comparatorBlock){
            return nil;
        }
        _comparatorBlock = comparatorBlock;
        _array = [NSMutableArray arrayWithObject:[NSNull null]];
    }
    return self;
}
-(void)addObject:(id)object{
    if(!object){
        return;
    }
    [self.array addObject:object];
    [self floatObjectAtIndex:self.array.count-1];
}
-(void)floatObjectAtIndex:(NSUInteger)index{
    if(index <= 1){
        return;
    }
    NSUInteger parentIndex = index/2;
    id childObj = [self.array objectAtIndex:index];
    id parentObj = [self.array objectAtIndex:parentIndex];
    if(self.comparatorBlock(parentObj,childObj) == NSOrderedDescending){
        [self.array exchangeObjectAtIndex:parentIndex withObjectAtIndex:index];
        [self floatObjectAtIndex:parentIndex];
    }
}
-(void)sinkObjectAtIndex:(NSUInteger)index{
    if(index >= self.array.count-1){
        return;
    }
    NSUInteger rightChildIndex = index * 2;
    NSUInteger leftChildIndex = index * 2 + 1;
    id parentObj = [self.array objectAtIndex:index];
    id rightChild = nil;
    id leftChild = nil;
    if(rightChildIndex < self.array.count){
        rightChild = [self.array objectAtIndex:rightChildIndex];
    }
    
    if(leftChildIndex < self.array.count){
        leftChild = [self.array objectAtIndex:leftChildIndex];
    }
    
    id minChild = nil;
    NSUInteger minChildIndex = 0;
    
    if(leftChild && rightChild){
        if(self.comparatorBlock(leftChild,rightChild) == NSOrderedDescending){
            minChild = rightChild;
            minChildIndex = rightChildIndex;
        }else{
            minChild = leftChild;
            minChildIndex = leftChildIndex;
        }
    }else if(leftChild){
        minChild = leftChild;
        minChildIndex = leftChildIndex;
    }else if(rightChild){
        minChild = rightChild;
        minChildIndex = rightChildIndex;
    }
    
    if(minChild && self.comparatorBlock(parentObj,minChild) == NSOrderedDescending){
        [self.array exchangeObjectAtIndex:index withObjectAtIndex:minChildIndex];
        [self sinkObjectAtIndex:minChildIndex];
    }
}
-(id)peekMinObject{
    if(self.count <= 0){
        return nil;
    }
    return [self.array objectAtIndex:1];
}
-(id)removeMinObject{
    if(self.count <= 0){
        return nil;
    }
    [self.array exchangeObjectAtIndex:self.array.count-1 withObjectAtIndex:1];
    id result = [self.array lastObject];
    [self.array removeLastObject];
    [self sinkObjectAtIndex:1];
    return result;
}
-(NSUInteger)count{
    return self.array.count-1;
}
@end
