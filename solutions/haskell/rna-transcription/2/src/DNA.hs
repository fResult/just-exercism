module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA ""     = Right ""
toRNA (x:xs) = case complement x of
   Just nucleotides -> (nucleotides :) <$> toRNA xs
   Nothing          -> Left x

complement :: Char -> Maybe Char
complement 'G' = Just 'C'
complement 'C' = Just 'G'
complement 'T' = Just 'A'
complement 'A' = Just 'U'
complement _   = Nothing 
