module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA ""     = Right ""
toRNA (x:xs) = case x of
  'G'                -> ('C' :) <$> toRNA xs
  'C'                -> ('G' :) <$> toRNA xs
  'T'                -> ('A' :) <$> toRNA xs
  'A'                -> ('U' :) <$> toRNA xs
  invalidNucleotides -> Left invalidNucleotides
