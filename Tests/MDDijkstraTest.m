//
//  MDDijkstraTest.m
//  MDDijkstra
//
//  Created by mohamed mohamed El Dehairy on 12/6/16.
//  Copyright © 2016 mohamed El Dehairy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MDDijkstra.h"
#import "TestGraphNode.h"

@interface MDDijkstraTest : XCTestCase

@end

@implementation MDDijkstraTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFastestPath {
    
    NSArray<TestGraphNode*>* graph = [self createTestGraph];
    
    MDDijkstra *dijkstra = [[MDDijkstra alloc] initWithGraph:graph];
    
    MDRouteNode *routeNode = [dijkstra findFastestPathBetweenStartNodeAtIndex:0 endNodeIndex:4];

    [self validateRoute:routeNode againstGraph:graph];
    
    XCTAssertEqual(routeNode.graphNodeIndex, 0);
    XCTAssertEqual(routeNode.nextNode.graphNodeIndex, 3);
    XCTAssertEqual(routeNode.nextNode.nextNode.graphNodeIndex, 4);
    XCTAssertEqual(routeNode.nextNode.nextNode.routeWeight.floatValue, 15.0);
}

- (void)testPerformance{
    MDDijkstra *dijkstra = [[MDDijkstra alloc] initWithGraph:[self createTestGraph]];
    
    [self measureBlock:^{
        MDRouteNode *routeNode = [dijkstra findFastestPathBetweenStartNodeAtIndex:0 endNodeIndex:4];
    }];
    
}

-(NSArray<id<MDGraphNode>>*)createTestGraph{
    
    TestGraphNode *node0 = [TestGraphNode new];
    TestGraphNode *node1 = [TestGraphNode new];
    TestGraphNode *node2 = [TestGraphNode new];
    TestGraphNode *node3 = [TestGraphNode new];
    TestGraphNode *node4 = [TestGraphNode new];
    
    node0.adjacentNodesIndexes = @[@1,@3];
    node0.weights = @[@60.0,@10.0];
    
    node1.adjacentNodesIndexes = @[@2];
    node1.weights = @[@30.0];
    
    node2.adjacentNodesIndexes = @[@3];
    node2.weights = @[@10.0];
    
    node3.adjacentNodesIndexes = @[@0,@4];
    node3.weights = @[@20,@5];
    
    
    return @[node0,node1,node2,node3,node4];
}

-(void)validateRoute:(MDRouteNode*)routeNode againstGraph:(NSArray<TestGraphNode*>*)graph{
    MDRouteNode *head = routeNode;
    double weightCounter = 0;
    while (head.nextNode) {
        TestGraphNode *graphNode = graph[head.graphNodeIndex];
        XCTAssertEqual(weightCounter, head.routeWeight.doubleValue);
        XCTAssertTrue([graphNode.adjacentNodesIndexes containsObject:[NSNumber numberWithInteger:head.nextNode.graphNodeIndex]]);
        NSUInteger nextGraphNodeWeightIndex = [graphNode.adjacentNodesIndexes indexOfObject:[NSNumber numberWithInteger:head.nextNode.graphNodeIndex]];
        weightCounter += graphNode.weights[nextGraphNodeWeightIndex].doubleValue;
        head = head.nextNode;
    }
}

@end
