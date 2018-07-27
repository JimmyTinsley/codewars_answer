import Data.List

decendingOrder :: Integer -> Integer
decendingOrder = read . reverse . sort . show