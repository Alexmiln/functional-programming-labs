--task1
partitionN :: [a] -> Int ->[[a]]
partitionN xs n
    | n <= 0 = error "Invalid amount of lists"
      []
    | otherwise = go xs n
    where
        go [] _ = []
        go newxs num
            | length newxs < num = [newxs]
            | otherwise = take lsize newxs : go (drop lsize newxs) (num - 1)
            where
                lsize = (length xs + n - 1) `div` n

--task2
elemIndices :: Eq a => a -> [a] -> [Int]
elemIndices _ [] = []
elemIndices x xs = go xs 0
  where
    go [] _ = []
    go (y:ys) index
      | x == y = index : go ys (index + 1)
      | otherwise = go ys (index + 1)

--task3
powersList :: Int -> Int -> [[Int]]
powersList maxNum itemsInSubList =
  [[x^y | y <- [1..itemsInSubList]] | x <- [1..maxNum]]

main = do
    print(partitionN [1,2,3,4,5,6,7] 3)
    print(partitionN [1,2,3,4,5,6,7] 4)
    -- print(partitionN [1,2,3,4,5,6,7] 0)

    print(elemIndices 2 [1,2,3,1,2,3,4,2,1])
    print(elemIndices 2 [])

    print(powersList 4 2)