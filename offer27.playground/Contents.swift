import Cocoa


// * Definition for a binary tree node.

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
          self.val = val
          self.left = nil
          self.right = nil
      }
}

/// 二叉树的镜像
/// - Parameter root: _
/// - Returns: _
func mirrorTree(_ root: TreeNode?) -> TreeNode? {

    guard let root =  root else { return nil }
    let right = mirrorTree(root.right)
    let left = mirrorTree(root.left)
    root.left = right
    root.right = left
    return root
}
