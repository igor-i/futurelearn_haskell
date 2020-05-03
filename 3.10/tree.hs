module Tree where

data Tree = Leaf | Node Int Tree Tree deriving Show

treeDepth :: Tree -> Int
-- longest path from root to a leaf
treeDepth Leaf = 0
treeDepth (Node _ leftSubtree rightSubtree) =
  1 + max (treeDepth leftSubtree) (treeDepth rightSubtree)

isSortedTree :: Tree -> Int -> Int -> Bool
-- is the tree sorted in-order?
-- the two Int params indicate min and max
-- for the current subtree
isSortedTree Leaf _ _ = True
isSortedTree (Node x leftSubtree rightSubtree) minVal maxVal =
    let leftSorted  = isSortedTree leftSubtree minVal x
        rightSorted = isSortedTree rightSubtree x maxVal
    in x >= minVal && x< maxVal && leftSorted && rightSorted

addNewMax :: Tree -> Tree
-- add a new max element to tree
addNewMax Leaf = Node 0 Leaf Leaf  -- input tree with no nodes
addNewMax (Node x leftSubtree Leaf) = Node x leftSubtree (Node (x + 1) Leaf Leaf)  -- this is the rightmost Node
addNewMax (Node x leftSubtree rightSubtree) = Node x leftSubtree (addNewMax rightSubtree) -- intermediate node, go down right subtree

addNewMin :: Tree -> Tree
-- add a new min element to tree
addNewMin Leaf = Node 0 Leaf Leaf
addNewMin (Node x Leaf rightSubtree) = Node x (Node (x - 1) Leaf Leaf) rightSubtree
addNewMin (Node x leftSubtree rightSubtree) = Node x (addNewMin leftSubtree) rightSubtree

treeSum :: Tree -> Int
-- calculate a sum of all values in tree
treeSum Leaf = 0
treeSum (Node x leftSubtree rightSubtree) =
  x + (treeSum leftSubtree) + (treeSum rightSubtree)

addNew :: Tree -> Int -> Tree
-- add a new element to tree
addNew Leaf v = Node v Leaf Leaf
addNew (Node x leftSubtree rightSubtree) v
  | v >= x = Node x leftSubtree (addNew rightSubtree v)
  | otherwise = Node x (addNew leftSubtree v) rightSubtree

treeToList::Tree-> [Int]
-- convert tree into list
treeToList Leaf = []
treeToList (Node x leftSubtree rightSubtree) =
  x:(treeToList leftSubtree) ++ (treeToList rightSubtree)
