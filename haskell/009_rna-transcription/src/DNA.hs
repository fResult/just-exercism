module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA ""     = Right ""
toRNA (x:xs) = case complement x of
  Just nucleotide -> (nucleotide :) <$> toRNA xs
  Nothing         -> Left x

complement :: Char -> Maybe Char
complement 'G' = Just 'C'
complement 'C' = Just 'G'
complement 'T' = Just 'A'
complement 'A' = Just 'U'
complement _   = Nothing

-- First try
-- toRNA :: String -> Either Char String
-- toRNA ""     = Right ""
-- toRNA (x:xs) = case x of
  -- 'G'                -> ('C' :) <$> toRNA xs
  -- 'C'                -> ('G' :) <$> toRNA xs
  -- 'T'                -> ('A' :) <$> toRNA xs
  -- 'A'                -> ('U' :) <$> toRNA xs
  -- invalidNucleotides -> Left invalidNucleotides
