songDecoder :: String -> String
songDecoder str = result
  where 
    str1 = parse str []
    str2 = oneSpace str1 []
    result = removeSpace str2


parse :: String -> String -> String
parse []     str = str
parse (x:xs) str = do
    case x of 
        'W'   -> case (head xs) of 
                     'U'   -> case (head $ tail xs) of 
                                  'B'    -> parse (tail $ tail xs) (str ++ " ")
                                  _      -> parse (tail $ tail xs) (str ++ x:(head xs):(head $ tail xs):[])
                     _     -> parse (tail xs) (str ++ x:(head xs):[]) 
        _     -> parse xs (str ++ x:[])


oneSpace :: String -> String -> String 
oneSpace []       str = str
oneSpace [_]      str = str 
oneSpace (x:xs)   str = do
    case x of 
        ' '   -> case (head xs) of 
                     ' '   -> case (head $ tail xs) of 
                                  ' '    -> oneSpace(tail $ tail xs) str
                                  _      -> oneSpace(tail $ tail xs) (str ++ ' ':(head $ tail xs):[])
                     _     -> oneSpace (tail xs) (str ++ ' ':(head xs):[])
        _     -> oneSpace xs (str ++ x:[]) 


removeSpace :: String -> String
removeSpace (x:xs) = 
    case x of 
        ' ' -> case (last xs) of 
                   ' '  -> init xs
                   _    -> (xs)
        _   -> case (last xs) of
                   ' '  -> (x:(init xs))
                   _    -> (x:xs)