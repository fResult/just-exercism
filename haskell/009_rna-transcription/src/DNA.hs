module DNA (toRNA) where

type DNA = String
type RNA = String
type Nucleotide = Char

toRNA :: DNA -> Either Nucleotide RNA
toRNA ""     = Right ""
toRNA (x:xs) = case complement x of
  Left invalidNucleotide -> Left invalidNucleotide
  Right validNucleotide  -> (validNucleotide :) <$> toRNA xs

complement :: Nucleotide -> Either Nucleotide Nucleotide
complement 'G'               = Right 'C'
complement 'C'               = Right 'G'
complement 'T'               = Right 'A'
complement 'A'               = Right 'U'
complement invalidNucleotide = Left invalidNucleotide
