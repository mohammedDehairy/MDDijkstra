//
//  TestGraphNode.h
//  MDDijkstra
//
//  Created by mohamed mohamed El Dehairy on 12/7/16.
//  Copyright © 2016 mohamed El Dehairy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDGraphNode.h"

@interface TestGraphNode<MDGraphNode> : NSObject
@property(nonatomic,strong,nullable)NSArray<NSNumber*> *adjacentNodesIndexes;
@property(nonatomic,strong,nullable)NSArray<NSNumber*> *weights;
@end
