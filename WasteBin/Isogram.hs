import Data.Char
import Data.List

isIsogram :: String -> Bool
isIsogram []  = True
isIsogram (x1:xs1) = if (elem x xs) then False else isIsogram xs
  where
    (x:xs) = map toLower (x1:xs1)


-- Good Practice

-- module Isogram where
-- import Data.Char (toLower)
-- import Data.List

-- isIsogram :: String -> Bool
-- isIsogram str = null $ map toLower str \\ ['a'..'z']
