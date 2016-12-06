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
 */
@property(nonatomic,strong,readonly,nullable)NSArray<NSNumber*> *adjacentNodesIndexes;
/*!
 @brief Array of adjacent Nodes' weights
 */
@property(nonatomic,strong,readonly,nullable)NSArray<NSNumber*> *weights;
@end
