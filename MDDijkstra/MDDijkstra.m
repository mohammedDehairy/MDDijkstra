//
//  MDDijkstra.m
//  MDDijkstra
//
//  Created by mohamed mohamed El Dehairy on 12/4/16.
//  Copyright © 2016 mohamed El Dehairy. All rights reserved.
//

#import "MDDijkstra.h"

@interface MDDijkstra ()
@property(nonatomic,strong)NSArray<id<MDDijkstraNode>> *graph;
@end

@implementation MDDijkstra
-(instancetype)initWithGraph:(NSArray<id<MDDijkstraNode>> *)graph{
    if(!graph){
        return nil;
    }
    if(self = [super init]){
        _graph = graph;
    }
    return self;
}

-(id<MDDijkstraNode>)findFastestPathBetweenStartNodeAtIndex:(NSUInteger)startIndex endNodeIndex:(NSUInteger)endIndex{
    return nil;
}
@end
