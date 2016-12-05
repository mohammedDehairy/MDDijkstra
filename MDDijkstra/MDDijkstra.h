//
//  MDDijkstra.h
//  MDDijkstra
//
//  Created by mohamed mohamed El Dehairy on 12/4/16.
//  Copyright © 2016 mohamed El Dehairy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDDijkstraNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface MDDijkstra : NSObject
/*!
    @brief The Designated initializer
 
    @param graph : The graph to be traversed represented by and NSArray of Objects that implement the MDDijkstraNode protocol
 
    @warning : the initializer returns nil pointer if the graph parameter is nil
 */
-(instancetype)initWithGraph:(NSArray<id<MDDijkstraNode>>*)graph NS_DESIGNATED_INITIALIZER;
-(instancetype)init NS_UNAVAILABLE;
/*!
    @brief Calculates the fastest path between start node and end node in the graph
 
    @param startIndex : the start node index in the graph array passed to the initializer
 
    @param endIndex   : the end node index in the graph array passed to the initializer
 
    @return : returns a MDDijkstraNode instance that the represent the path start node and its adjacentNodes property has only one node (next node in the path), and the next node refere to its next node and so on, until the end node is reached, likewise the weights array for each node contain only one weight (the edge weight to the next node).
 
    @warning : the returned route head node might be nil, in case there is no route found from the specified start node to the specified end node
 */
-(nullable id<MDDijkstraNode>)findFastestPathBetweenStartNodeAtIndex:(NSUInteger)startIndex endNodeIndex:(NSUInteger)endIndex;
@end

NS_ASSUME_NONNULL_END
