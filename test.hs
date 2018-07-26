import Data.List
import Data.Char
-- calChar :: Int -> Char -> [Char] -> [Char]
-- calChar count a str = 
--     case str of 
--         []   -> count
--         _    ->  case (a == (head str)) of 
--                      True  -> calChar (count + 1) a (tail str)
--                      False -> calChar count a (tail str) 
    

-- dropChar :: Char -> [Char] -> [Char]
-- dropChar a str = 
--     case (elem a str) of 
--         False  -> str 
--         True   -> do 
--             let newstr = delete a str
--             dropChar a newstr



duplicateCount :: String -> Int
duplicateCount str = do 
    calDuplicate str 0 



calDuplicate :: [Char] -> Int -> Int
calDuplicate str1 count = 
    case (length str) > 1 of 
        False      -> count
        True       -> case (elem (head $ str) (tail $ str)) of 
                      False -> calDuplicate (tail str) count
                      True  -> do
                          let newstr = dropChar (head str) str 
                          calDuplicate newstr (count + 1)
  where 
    dropChar a str = 
        case (length str) > 1 of 
            False -> str
            True  -> case (elem a str) of 
                         False  -> str 
                         True   -> do 
                             let newstr = delete a str
                             dropChar a newstr
    str = map toLower str1



