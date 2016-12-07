//
//  MDDijkstra.h
//  MDDijkstra
//
//  Created by mohamed mohamed El Dehairy on 12/4/16.
//  Copyright © 2016 mohamed El Dehairy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDGraphNode.h"
#import "MDRouteNode.h"

NS_ASSUME_NONNULL_BEGIN
/*!
    @brief MDDijkstra is an Objective C implementation of Dijkstra shortest path algorithm
 */
@interface MDDijkstra : NSObject
/*!
    @brief The Designated initializer
 
    @param graph : The graph to be traversed represented by and NSArray of Objects that implement the MDDijkstraNode protocol
 
    @warning the initializer returns nil pointer if the graph parameter is nil
 */
-(instancetype)initWithGraph:(NSArray<id<MDGraphNode>>*)graph NS_DESIGNATED_INITIALIZER;
-(instancetype)init NS_UNAVAILABLE;
/*!
    @brief Calculates the fastest path between start node and end node in the graph
 
    @param startIndex : the start node index in the graph array passed to the initializer
 
    @param endIndex   : the end node index in the graph array passed to the initializer
 
    @return returns a MDRouteNode instance that links to the next route node that links to its next, all the way to the end route node, in a linked list datastructure fashion.
 
    @warning the returned route head node might be nil, in case there is no route found from the specified start node to the specified end node
 
    @warning The method throws an Exception if the graph is invalide, e.g a Graph node's weights array count is not equal to the adjacentNodesIndexes array count
 */
-(nullable MDRouteNode*)findFastestPathBetweenStartNodeAtIndex:(NSUInteger)startIndex endNodeIndex:(NSUInteger)endIndex;
@end

NS_ASSUME_NONNULL_END
