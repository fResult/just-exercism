module ReverseString (reverseString) where

import Data.List (foldl')

-- reverseString :: String -> String
-- reverseString = reverse

-- Time: O(n²), Space: O(n²)
-- reverseString :: String -> String
-- reverseString ""     = ""
-- reverseString (x:xs) = reverseString xs ++ [x]

-- Time: O(n²), Space: O(n²)
-- reverseString :: String -> String
-- reverseString = foldr (\x xs -> xs ++ [x]) ""

-- Time: O(n), Space: O(n)
reverseString :: String -> String
reverseString = foldl' (flip prependChar) ""

prependChar :: Char -> String -> String
prependChar = (:)
