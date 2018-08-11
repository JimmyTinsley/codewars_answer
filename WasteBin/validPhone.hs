import Data.List
import Data.Char
validPhoneNumber :: String -> Bool
validPhoneNumber str = (verifyPunctuation str) && (verifyNumber str)

verifyPunctuation :: String -> Bool 
verifyPunctuation str = [Just 0,Just 4,Just 5,Just 9] ==  map (`elemIndex` str) "() -" 

verifyNumber :: String -> Bool
verifyNumber str = 10 == (length $ filter (not.util) str)

util :: Char -> Bool
util s = elem s "() -"


-- Good Practice

-- validPhoneNumber :: String -> Bool
-- validPhoneNumber str = "(###) ###-####" == map transformDigit str
--   where transformDigit ch
--           | isDigit ch = '#'
--           | ch == '#'  = '!'
--           | otherwise  = ch