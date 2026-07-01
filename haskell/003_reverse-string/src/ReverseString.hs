module ReverseString (reverseString) where

-- reverseString :: String -> String
-- reverseString = reverse

-- reverseString :: String -> String
-- reverseString ""     = ""
-- reverseString (x:xs) = reverseString xs ++ [x]

reverseString :: String -> String
reverseString = foldr (\x xs -> xs ++ [x]) []
