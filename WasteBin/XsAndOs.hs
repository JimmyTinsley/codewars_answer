import Data.Char

transform :: Char -> Int 
transform 'x' = 1
transform 'o' = -1
transform  _  = 0


xo :: String -> Bool
xo str = sum result == 0 
  where 
    result = map transform $ map toLower str