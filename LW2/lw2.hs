-- 0. do_my_list(N)
do_my_list :: Int -> [Int]
do_my_list n = [n .. 2*n-1]

-- 1. oddEven(L)
oddEven :: [a] -> [a]
oddEven [] = []
oddEven [a] = [a]
oddEven (x:y:xs) = y : x : oddEven xs

-- 2. insert (L,A,n)
insert :: Eq a => ([a], a, Int) -> [a]
insert (list, atom, position)
    | position < 0 || position > length list = error "Invalid position"
    | otherwise = take position list ++ [atom] ++ drop position list

--3.  listSumm(L1,L2)
listSumm :: Num a => [a] -> [a] -> [a]
listSumm [] [] = []
listSumm [] xs = xs
listSumm ys [] = ys
listSumm (x:xs) (y:ys) = (x+y) : listSumm xs ys

--4. position (L,A)
position :: Eq a => [a] -> a -> Int
position list atom
    | list == [] = error "Empty list"
    | otherwise = head glist
    where glist = [x | (x, y) <- zip [0..length list - 1] list, y == atom]

--5. F(n)=∑i=1n (i)
sumToN :: Int -> Int
sumToN n = sum [1..n]

--6. F(n)=∑i=1n(n−i)
sumToNbutItIsAbsolutelyAnotherSum :: Int -> Int
sumToNbutItIsAbsolutelyAnotherSum n = sum [(n - i) | i <- [1..n]]


main :: IO ()
main = do
    print(do_my_list (5))
    print(oddEven [2,5,7,9,1,8])
    print(insert ([1, 2, 3, 4], 5, 2))
    print(listSumm [1, 2, 3] [4, 5, 6, 7, 8])
    print(position [5,4,3,3,1,2,7] 2)
    print(sumToN 5)
    print(sumToNbutItIsAbsolutelyAnotherSum 5)