--module Codewars.Kata.DNA where
--import Codewars.Kata.DNA.Types



dnaStrand :: [Char] -> [Char]
dnaStrand = map pattern 


pattern :: Char -> Char
pattern 'A' = 'T'
pattern 'T' = 'A'
pattern 'G' = 'C'
pattern 'C' = 'G'