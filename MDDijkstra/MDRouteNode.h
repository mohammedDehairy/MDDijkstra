//
//  MDRouteNode.h
//  MDDijkstra
//
//  Created by mohamed mohamed El Dehairy on 12/6/16.
//  Copyright © 2016 mohamed El Dehairy. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
    @brief MDRouteNode is wrapper for MDGraphNode objects, that represents a node in a certain path through a graph, in a linked list fashion
 */
@interface MDRouteNode : NSObject
/*!
    @brief A pointer to the next route node in the path through the graph
 */
@property(nonatomic,strong,nullable)MDRouteNode *nextNode;
/*!
    @brief The index of the wraped MDGraphNode in the graph array
 */
@property(nonatomic,assign)NSUInteger graphNodeIndex;
/*!
    @brief The current accumulated weight of the route from the start graph node, if the current route node is the end route node, then the weight represent the weight of the whole route
 */
@property(nonatomic,strong,nonnull)NSNumber *routeWeight;

@end
