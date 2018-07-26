import Data.Char

accum :: String -> String
accum s = result
  where
    lowers = map toLower s
    result = mumbling 0 lowers "" 

mumbling :: Int -> String -> String -> String
mumbling count oldStr  newStr = 
    case count + 1 > length oldStr of 
        True  -> newStr
        False -> case count of 
            0 -> do
                let newStr1 = replicate 1 (toUpper (oldStr!!count))
                mumbling (count + 1) oldStr newStr1
            _ -> do 
                let newStr1 = newStr ++ "-" ++ replicate 1 (toUpper $ oldStr!!count) ++ (replicate count (oldStr!!count))
                mumbling (count + 1) oldStr newStr1

   
-- Good Practice


-- module Codewars.G964.Accumule where
-- import Data.Char
-- import Data.List

-- rep :: Int -> Char -> String
-- rep 0 c = [toUpper c]
-- rep i c = [toUpper c] ++ (replicate i $ toLower c)

-- accum :: String -> String
-- accum [] = []
-- accum s = intercalate "-" $ zipWith rep [0..] s