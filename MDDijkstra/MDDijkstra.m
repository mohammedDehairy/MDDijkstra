//
//  MDDijkstra.m
//  MDDijkstra
//
//  Created by mohamed mohamed El Dehairy on 12/4/16.
//  Copyright © 2016 mohamed El Dehairy. All rights reserved.
//

#import "MDDijkstra.h"
#import "MDPriorityQueue.h"

@interface MDDijkstra ()
@property(nonatomic,strong)NSArray<id<MDGraphNode>> *graph;
@end

@implementation MDDijkstra
-(instancetype)initWithGraph:(NSArray<id<MDGraphNode>> *)graph{
    if(!graph){
        return nil;
    }
    if(self = [super init]){
        _graph = graph;
    }
    return self;
}

-(nullable MDRouteNode*)findFastestPathBetweenStartNodeAtIndex:(NSUInteger)startIndex endNodeIndex:(NSUInteger)endIndex{
    
    /**
        Create the priority queue
     **/
    MDPriorityQueue<MDRouteNode*> *priorityQueue = [[MDPriorityQueue alloc] initWithComparatorBlock:^NSComparisonResult(MDRouteNode *node1,MDRouteNode *node2){
        return [node1.routeWeight compare:node2.routeWeight];
    }];
    
    // Declare the result route head node
    MDRouteNode *resultRouteNode = nil;
    
    // Create the start route node
    MDRouteNode *routeNode = [[MDRouteNode alloc] init];
    routeNode.routeWeight = @0;
    routeNode.graphNodeIndex = startIndex;
    
    // Add the start route node to the queue
    [priorityQueue addObject:routeNode];
    
    
    while (priorityQueue.count > 0) {
        
        // Remove the currently minimum cost route node from the queue
        MDRouteNode *routeNode = [priorityQueue removeMinObject];
        
        // Don't resvisit already visited nodes, to prevent infinit cycles
        if(routeNode.visited){
            continue;
        }
        
        // Mark the route node as visited
        routeNode.visited = YES;
        
        // Check if we have found our destination node
        if(endIndex == routeNode.graphNodeIndex){
            // We have found our destination successfully
            resultRouteNode = routeNode;
            break;
        }
        
        // Get the graph node associated with the currently visited route node
        id<MDGraphNode> currentGraphNode = self.graph[routeNode.graphNodeIndex];
        
        // Loop through all adjacent graph nodes to the currently visited graph node, wrap it in a MDRouteNode, and add it to the queue
        for(NSInteger i = 0; i < currentGraphNode.adjacentNodesIndexes.count; i++){
            
            // Get the adjacent Node weight
            NSNumber *adjacentGraphNodeWeight = currentGraphNode.weights[i];
            // Get the adjacent Node index
            NSNumber *adjacentGraphNodeIndex = currentGraphNode.adjacentNodesIndexes[i];
            
            // Wrap the adjacent graph node inside a MDRouteNode
            MDRouteNode *adjacentRouteNode = [MDRouteNode new];
            adjacentRouteNode.graphNodeIndex = adjacentGraphNodeIndex.integerValue;
            adjacentRouteNode.routeWeight = [NSNumber numberWithFloat:routeNode.routeWeight.floatValue+[adjacentGraphNodeWeight floatValue]];
            adjacentRouteNode.nextNode = routeNode;
            
            
            // Add the wrapper MDRouteNode to the priority queue
            [priorityQueue addObject:adjacentRouteNode];
        }
    }
    return [self reverseRoute:resultRouteNode];
}
-(MDRouteNode*)reverseRoute:(MDRouteNode*)routeNode{
    MDRouteNode *head = routeNode;
    MDRouteNode *preNode = nil;
    while (head) {
        MDRouteNode *nextNode = head.nextNode;
        head.nextNode = preNode;
        preNode = head;
        head = nextNode;
    }
    return head;
}
@end
