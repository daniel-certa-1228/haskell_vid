hypoteneuse a b = sqrt (a^2 + b^2)
-- hypoteneuse 3 4 == 5.0
-- haskell's lazy type inference decided that 3 and 4 were floats because 'sqrt' requires them to be

identifyCamel humps = if humps == 1
                        then "dromedary"
                        else "Bactrian"
-- there must always be an 'else', a haskell function always returns a value

newList = [4,8,15,16,23,42]
nl1 = head newList -- 4
nl2 = tail newList -- [8,15,16,23,42]
nl3 = tail (tail (tail (tail (tail newList)))) -- 42

-- 'cons' operator :
c1 = 5:[] -- [5]
c2 = 1:5:[] -- [1,5]
c3 = c1 ++ c2 -- [5,1,5]
c4 = 49:c3 -- [49,5,1,5]

lengthEx = length newList -- 3
revEx = reverse newList -- [42,23,16,15,8,4]
indexEx = newList !! 3 -- 16
indexEx2 = revEx !! 3 -- 15
lastEx = last newList -- 42
initEx = init newList -- [4,8,15,16,23] -- init takes all the numbers but the last one.  opposite of 'head'
nullEx1 = null newList -- False
nullEx2 = null [] --True
elemEx = elem 42 newList -- True
elemEx2 = elem 43 newList -- False

--Haskell strings are lists of characters
strList1 = ['F', 'r', 'o', 'd', 'o'] -- "Frodo"
strList2 = "adam" < "ant" -- True
listOfLists = [[1,2,3,4],[5,6,7,8]]
minEx = minimum newList -- 4
maxEx = maximum newList -- 42
sumEx = sum newList -- 108
prodEx = product newList -- 7418880
rangeEx1 = sum [1..100] -- 5050
rangeEx2 = [2,4..20] --[2,4,6,8,10,12,14,16,18,20]
rangeEx3 = [10,9..1] -- [10,9,8,7,6,5,4,3,2,1]
rangeEx4 = ['a'..'h'] -- "abcdefgh"
rangeEx5 = take 5 [1..] -- [1,2,3,4,5]

-- List comprehension
l1 = [2^n | n <- [1..10]] -- [2,4,8,16,32,64,128,256,512,1024]
l2 = [2^n | n <- [1..10], 2^n >= 10, 2^n < 100] --[16,32,64]
l3 = [x | x <- "outrageous", not (x `elem` "aeiou")] -- "trgs"
l4 = [[x | x <- word, not (x `elem` "aeiou")] | word <- ["bell", "book", "candle"]] -- ["bll","bk","cndl"]
l5 = [[x * y | y <- [1..5]] | x <- [1..5]] -- [[1,2,3,4,5],[2,4,6,8,10],[3,6,9,12,15],[4,8,12,16,20],[5,10,15,20,25]]

--Tuples
-- the size of a Tuple is part of its type
--Tuples can contain values of different types
fst1 = fst ("Fred", "Ginger") -- "Fred"
snd1 = snd ("Fred", "Ginger") -- "Ginger"

zip1 = zip [1,2,3,4] ["one", "two", "three", "four"] -- [(1,"one"),(2,"two"),(3,"three"),(4,"four")]

-------------------------
numbers1 = [1..8]
words1 = ["one", "two", "three", "four", "five", "six", "seven", "eight"]
pairs = zip numbers1 words1 -- [(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five"),(6,"six"),(7,"seven"),(8,"eight")]
allPairs = [(fst p, fst q) | p <- pairs, q <- pairs] -- [(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8)]
allWhereFirstIsSmaller = [(fst p, fst q) | p <- pairs, q <- pairs, fst p < fst q] -- [(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(3,4),(3,5),(3,6),(3,7),(3,8),(4,5),(4,6),(4,7),(4,8),(5,6),(5,7),(5,8),(6,7),(6,8),(7,8)]
pairsWhere1stWordIsSmaller = [(fst p, fst q) | p <- pairs, q <- pairs, fst p < fst q, length (snd p) > length (snd q)] --[(3,4),(3,5),(3,6),(4,6),(5,6)]

-- Types and Typeclasses
-- Types are sets of values
--Typeclasses are sets of Types
f :: [Int] -> Int
f xs = head xs + length xs

dividesEvenly :: Int -> Int -> Bool
dividesEvenly x y = (y `div` x) * x == y

-- Function syntax
-- this form works, but sucks
increasing :: (Ord a) => [a] -> Bool
increasing xs = if xs == []
                then True
                else if tail xs == []
                    then True
                    else if head xs <= head (tail xs)
                        then increasing (tail xs)
                        else False

--re-written with pattern matching
increasing' :: (Ord a) => [a] -> Bool
increasing' [] = True
increasing' [x] = True
increasing' (x:y:ys) = x <= y && increasing' (y:ys)

--shit version
noVowels :: [Char] -> [Char]
noVowels word = if word == ""
                then ""
                else if head word `elem` "aeiouAEIOU"
                    then noVowels (tail word)
                    else (head word) : noVowels (tail word)

-- with pattern matching
noVowels' :: [Char] -> [Char]
noVowels' "" = ""
noVowels' (x:xs) = if x `elem` "aeiouAEIOU"
                   then noVowels' xs
                   else x : noVowels' xs

-- with guards
noVowels2 :: [Char] -> [Char]
noVowels2 "" = ""
noVowels2 (x:xs)
    | x `elem` "aeiouAEIOU" = noVowels2 xs
    | otherwise             = x : noVowels2 xs

-- watch, shit version
watch :: Int -> [Char]
watch n = if n == 7
          then "7 o'clock and your mom"
          else show n ++ " o'clock"

-- with pattern matching
watch' :: Int -> [Char]
watch' 7 = "7 o'clock and your mom"
watch' n = show n ++ " o'clock"


