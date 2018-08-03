import Data.List 
import Data.Char

toWeirdCase :: String -> String 
toWeirdCase str = toWeird  (words $ (map toLower str)) []

toWeird :: [String] -> String -> String 
toWeird []     str = str
toWeird (x:xs) []  = toWeird xs (makeWord x [])
toWeird (x:xs) str = toWeird xs (str ++ " " ++ (makeWord x []))

makeWord :: String -> String -> String
makeWord []     newWord = newWord
makeWord (y:ys) []      = makeWord ys (toUpper y:[])
makeWord (y:ys) newWord = case isAlpha $ last newWord of 
    True    ->  if (isLower $ last newWord)
                    then makeWord ys (newWord ++ (toUpper y:[]))  
                    else makeWord ys (newWord ++ y:[])
    False   -> makeWord ys (newWord ++ (toUpper y:[]))


--Best Practice
-- import Data.Char (toUpper, toLower)

-- toWeirdCase :: String -> String
-- toWeirdCase = unwords . map (zipWith ($) weird) . words
--   where weird = cycle [toUpper, toLower]         