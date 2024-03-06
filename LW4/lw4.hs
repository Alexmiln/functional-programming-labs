import Data.Map

-- Data.List singleton
-- a -> [a]
-- создаёт список, содержащий единственный элемент.
-- ghci> singleton 42
-- [42]
--
-- ghci> singleton "hello"
-- ["hello"]
-- 
-- ghci> singleton 'a'
-- "a"

newSingleton :: a -> [a]
newSingleton x = [x]

-- Data.Char isLetter
-- Char -> Bool
-- Проверяет, является ли символ буквой (верхнего или нижнего регистра).
-- ghci> isLetter 'A'
-- True
--
-- ghci> isLetter '3'
-- False
--
-- ghci> isLetter 'g'
-- True

newIsLetter :: Char -> Bool
newIsLetter char = char >= 'a' && char <= 'z' || char >= 'A' && char <= 'Z'

-- Data.Map adjust
-- Применяет функцию к значению, связанному с ключом в Map.
-- (a -> a) -> k -> Map k a -> Map k a
-- ghci> adjust ("new " ++) 5 ([(5,"a"), (3,"b")])
-- [(5,"new a"),(3,"b")]
--
-- ghci> adjust ("new " ++) 8 ([(5,"a"), (3,"b")])
-- [(5,"a"),(3,"b")]

newAdjust :: Eq k => (a -> a) -> k -> [(k, a)] -> [(k, a)]
newAdjust _ _ [] = []
newAdjust f key ((k, v):xs)
  | key == k   = (k, f v) : xs
  | otherwise  = (k, v) : newAdjust f key xs

-- Data.Set size
-- Set a -> Int
-- Возвращает количество элементов в множестве
-- > let mySet = fromList [1, 2, 3, 4, 5]
-- > size mySet
-- 5
--
-- > let duplicatedSet = fromList [1, 2, 2, 3, 3, 3]
-- > size duplicatedSet
-- 3

data MySet a = EmptySet | Node a (MySet a) (MySet a) deriving Show

newSize :: MySet a -> Int
newSize EmptySet = 0
newSize (Node _ left right) = 1 + newSize left + newSize right

-- Data.Char toUpper
-- Char -> Char
-- Функция toUpper принимает символ в нижнем регистре и возвращает его эквивалент в верхнем регистре. 
-- Если входной символ уже в верхнем регистре или не является буквой, функция возвращает его без изменений.
-- >  toUpper 'a'
-- 'A'
--
-- > toUpper 'Z'
-- 'Z'
--
-- > toUpper '1'
-- '1'
newToUpper :: Char -> Char
newToUpper c
    | 'a' <= c && c <= 'z' = toEnum $ fromEnum c - fromEnum 'a' + fromEnum 'A'
    | otherwise = c

main = do
  print $ newSingleton 'a'
  print $ newSingleton [1,2,3]

  print $ newIsLetter 'a'
  print $ newIsLetter 'A'
  print $ newIsLetter '6'

  print $ newAdjust ("new " ++) 5 ([(5,"a"), (3,"b")])
  print $ newAdjust ("new " ++) 8 ([(5,"a"), (3,"b")])

  let mySet = Node 1 (Node 2 EmptySet EmptySet) (Node 3 EmptySet EmptySet)
  print $ newSize mySet

  print $ newToUpper 'a'