module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0    = Nothing
  | otherwise = Just (steps n)

steps :: Integer -> Integer
steps 1 = 0
steps n = steps (next n) + 1

next :: Integer -> Integer
next n
  | odd n  = n * 3 + 1
  | even n = n `div` 2

