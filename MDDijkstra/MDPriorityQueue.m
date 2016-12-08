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
    
    // Two arrays to hold both children and children indexes
    NSMutableArray *children = [NSMutableArray arrayWithCapacity:2];
    NSMutableArray<NSNumber*> *childrenIndexes = [NSMutableArray arrayWithCapacity:2];
    
    if(rightChildIndex < self.array.count){
        [children addObject:self.array[rightChildIndex]];
        [childrenIndexes addObject:[NSNumber numberWithInteger:rightChildIndex]];
    }
    
    if(leftChildIndex < self.array.count){
        [children addObject:self.array[leftChildIndex]];
        [childrenIndexes addObject:[NSNumber numberWithInteger:leftChildIndex]];
    }
    
    if(children.count == 0){
        return;
    }
    
    // Sort both children and children indexes
    children = [[children sortedArrayUsingComparator:self.comparatorBlock] mutableCopy];
    childrenIndexes = [[childrenIndexes sortedArrayUsingComparator:^NSComparisonResult(NSNumber *index1,NSNumber *index2){
        id child1 = self.array[index1.integerValue];
        id child2 = self.array[index2.integerValue];
        return self.comparatorBlock(child1,child2);
    }] mutableCopy];
    
    // if parent is greater than the minimum child, swap them and recurse, else if parent is greater than the max child, then swap and recurse, otherwise then the parent can't be sinked any more
    if(self.comparatorBlock(parentObj,children[0]) == NSOrderedDescending){
        [self.array exchangeObjectAtIndex:index withObjectAtIndex:childrenIndexes[0].integerValue];
        [self sinkObjectAtIndex:childrenIndexes[0].integerValue];
    }else if(children.count == 2){
        if(self.comparatorBlock(parentObj,children[1]) == NSOrderedDescending){
            [self.array exchangeObjectAtIndex:index withObjectAtIndex:childrenIndexes[1].integerValue];
            [self sinkObjectAtIndex:childrenIndexes[1].integerValue];
        }
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
