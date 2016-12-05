//
//  MDDijkstraNode.h
//  MDDijkstra
//
//  Created by mohamed mohamed El Dehairy on 12/5/16.
//  Copyright © 2016 mohamed El Dehairy. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
    @brief A protocol that represent a graph node
 */
@protocol MDDijkstraNode <NSObject>
/*!
    @brief Array of current Node adjacent nodes
 */
@property(nonatomic,strong,readonly,nullable)NSArray<id<MDDijkstraNode>> *adjacentNodes;
/*!
    @brief Array of adjacent Nodes' weights
 */
@property(nonatomic,strong,readonly,nullable)NSArray<NSNumber*> *weights;
@end
