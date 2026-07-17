module Pangram (isPangram) where

import Data.Char (toLower)
import Data.List (nub)
import qualified Data.Set as Set

-- import Data.Char ()

isPangram :: String -> Bool
isPangram text = length (filter inAlphs uniqChars) >= length alphs
  where
    uniqChars = (nub . map toLower) text
    alphs = Set.fromList ['a' .. 'z']
    inAlphs ch = ch `elem` alphs
