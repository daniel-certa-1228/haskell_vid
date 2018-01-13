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



