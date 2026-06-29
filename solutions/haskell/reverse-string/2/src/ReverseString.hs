module ReverseString (reverseString) where

reverseString :: String -> String
-- reverseString = reverse
-- reverseString ""     = ""
-- reverseString (x:xs) = reverseString xs ++ [x]
reverseString = foldr (\x xs -> xs ++ [x]) []
