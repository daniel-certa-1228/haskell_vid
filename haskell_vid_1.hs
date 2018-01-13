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

