{-# LANGUAGE OverloadedStrings #-}

module Bob (responseFor) where

import Data.Char (isAlpha, isSpace, isUpperCase)
import Data.Text (Text)
import qualified Data.Text as T

responseFor :: Text -> Text
responseFor xs
  | isSilence xs          = "Fine. Be that way!"
  | isShoutingQuestion xs = "Calm down, I know what I'm doing!"
  | isQuestion xs         = "Sure."
  | isShouting xs         = "Whoa, chill out!"
  | otherwise             = "Whatever."

isShoutingQuestion :: Text -> Bool
isShoutingQuestion = (&&) <$> isQuestion <*> isShouting

isQuestion :: Text -> Bool
isQuestion = T.isSuffixOf "?" . T.filter (not . isSpace)

isShouting :: Text -> Bool
isShouting = ((&&) <$> (not . T.null) <*> T.all isUpperCase) . T.filter isAlpha

isSilence :: Text -> Bool
isSilence = T.all isSpace
