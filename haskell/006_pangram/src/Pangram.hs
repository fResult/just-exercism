module Pangram (isPangram) where

import Data.Char (toLower)
import Data.List (nub)
import qualified Data.Set as Set

isPangram :: String -> Bool
isPangram text = length (filter inAlphs uniqChars) >= Set.size alphs
  where
    uniqChars  = (nub . map toLower) text
    alphs      = Set.fromList ['a' .. 'z']
    inAlphs ch = ch `Set.member` alphs
