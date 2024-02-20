-- 1. listnums
listnums :: Int -> [Int]
listnums n
    | n <= 0 = []
    | otherwise = n : listnums(n-1)

-- 2. secondlastlist
secondlastlist :: [[a]] -> [a]
secondlastlist [] = []
secondlastlist (x:xs) = last x : secondlastlist xs

--3. myunion
myunion :: Eq a => [a] -> [a] -> [a]
myunion [] ys = ys
myunion (x:xs) ys
    | elem x ys = myunion xs ys
    | otherwise = x : myunion xs ys

--4. mysubst
mysubst :: Eq a => [a] -> [a] -> [a]
mysubst [] _ = []
mysubst xs [] = xs
mysubst (x:xs) ys
    | elem x ys = mysubst xs ys
    | otherwise = x : mysubst xs ys

--5. takeNElem
takeNElem :: Int -> [[a]] -> [a]
takeNElem _ [] = []
takeNElem n list = map (\x -> x !! n) list


main :: IO()
main = do
    print $ listnums 5
    print $ secondlastlist [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    print $ myunion [12 ,1, 2, 3, 0, 9, 8] [1, 2, 3, 4, 5, 6, 7]
    print $ mysubst [12 ,1, 2, 3, 0, 9, 8] [1, 2, 3, 4, 5, 6, 7]
    print $ takeNElem 0 [[1, 2, 3],[4,5,6],[7,8,9]]
