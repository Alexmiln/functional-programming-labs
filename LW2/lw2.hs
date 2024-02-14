-- 0. do_my_list(N)
do_my_list :: Int -> [Int]
do_my_list n = [n .. 2*n-1]


-- 1. oddEven(L)
oddEven :: [l] -> [l]
oddEven [] = []
oddEven [l] = [l]
oddEven (x1, x2, xs) = x2 : x1 : oddEven xs

main :: IO ()
main = do
    -- do_my_list(5)
    print(oddEven [2,5,7,9,1,8])