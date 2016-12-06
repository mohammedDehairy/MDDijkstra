//
//  MDRouteNode.h
//  MDDijkstra
//
//  Created by mohamed mohamed El Dehairy on 12/6/16.
//  Copyright © 2016 mohamed El Dehairy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MDGraphNode;

@interface MDRouteNode : NSObject
@property(nonatomic,strong,nullable)MDRouteNode *nextNode;
@property(nonatomic,assign)NSUInteger graphNodeIndex;
@property(nonatomic,strong,nonnull)NSNumber *routeWeight;
@property(nonatomic,assign)BOOL visited;
@end
