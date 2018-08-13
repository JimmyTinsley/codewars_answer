import Data.List

anagrams :: String -> [String] -> [String]
anagrams w ws =  map (ws!!) indexList
  where 
    list1     = sort w
    list2     = map sort ws
    indexList = elemIndices list1 list2



-- Good Practice

--1 
-- anagrams :: String -> [String] -> [String]
-- anagrams w ws = filter isAnagram ws 
--   where sorted = sort w 
--         isAnagram x = (sort x) == sorted


--2 Use Data.Function (on)
-- anagrams :: String -> [String] -> [String]
-- anagrams = filter . ((==) `on` sort)