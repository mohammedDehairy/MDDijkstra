//
//  MDGraphNode.h
//  MDDijkstra
//
//  Created by mohamed mohamed El Dehairy on 12/6/16.
//  Copyright © 2016 mohamed El Dehairy. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
 @brief A protocol that represent a graph node
 */
@protocol MDGraphNode <NSObject>
/*!
 @brief Array of the current Node adjacent nodes indexes, the contained indexes refer to its the adjacent nodes positions in the graph 
 
 @discussion If the weight associated with an adjacent node is infinit (i.e there is no edge between them), then simply don't include it in the adjacentNodesIndexes array nor the weights array
 */
@property(nonatomic,strong,nullable)NSOrderedSet<NSNumber*> *adjacentNodesIndexes;
/*!
 @brief Array of adjacent Nodes' weights
 */
@property(nonatomic,strong,nullable)NSOrderedSet<NSNumber*> *weights;
@end
