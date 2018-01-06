// Linked List
// Goktug Gumus
// Created at 06.01.2018
import Foundation

class Node {
  var value: Int!
  var next: Node?
  
  init (value: Int, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}

extension Node: Equatable {
  static func == (lhs: Node, rhs: Node) -> Bool {
    return lhs.value == rhs.value
  }
}

func isContainsCycle(_ node: Node) -> Bool {
  var previousNodes = [Node]()
  
  return isNodeContainsCycle(node, previousNodes: &previousNodes)
}

private func isNodeContainsCycle(_ node: Node?, previousNodes: inout [Node]) -> Bool {
  guard let node = node else { return false }
  
  if previousNodes.contains(node) {
    return true
  }
  
  previousNodes.append(node)
  
  return isNodeContainsCycle(node.next, previousNodes: &previousNodes)
}

/*
 Example Linked List
 
 1 -> 2 -> 3 -> 4
      ^         |
      |_________|
 */

// Create Linked List
// Returns head node
func createLinkedList() -> Node {
  let range: Int = 10
  var linkedList = [Node]()
  
  print("Linked List")
  
  for i in 0..<range {
    let node: Node = Node(value: range - i, next: i == 0 ? nil : linkedList[i - 1])
    
    linkedList.append(node)
  }
  
  // Add cycle
  let middleNode: Node = linkedList[Int(floor(Double(range) / 2))]
  linkedList.first!.next = middleNode

  // Print Linked List
  for i in (0..<range).reversed() {
    print(linkedList[i].value, terminator:" -> ")
  }
  
  print(middleNode.value, terminator: "")
  print("\n-----------")
  
  return linkedList.last as! Node
}

let headNode: Node = createLinkedList()

print("Contains Cycle: \(isContainsCycle(headNode))")
