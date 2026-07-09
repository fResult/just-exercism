{-# LANGUAGE OverloadedStrings #-}

module Bob (responseFor) where

import Data.Char (isUpperCase)
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
isQuestion = T.isSuffixOf "?" . T.filter notInSilences

-- endsWithSpace :: Text -> Bool
-- endsWithSpace = T.isSuffixOf " "

isShouting :: Text -> Bool
isShouting = ((&&) <$> (\x -> T.length x > 0) <*> T.all isUpperCase) . T.filter inAlphs

isSilence :: Text -> Bool
isSilence = noChar . T.filter notInSilences

noChar :: Text -> Bool
noChar text = T.length text <= 0

notInSilences :: Char -> Bool
notInSilences ch = ch `notElem` ("\n\r \t" :: String)

inAlphs :: Char -> Bool
inAlphs ch = ch `elem` ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" :: String)
