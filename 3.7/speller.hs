module Speller where

-- speller ["whisky", "x-ray"] -- > "w is for whisky, and x is for x-ray"
speller :: [[Char]] -> [Char]
speller [] = ""
speller [word] = spellerize word
speller (word:words)
  | length words == 1 = spellerize word ++ ", and " ++ speller words
  | otherwise = spellerize word ++ ", " ++ speller words

-- spellerize "zoo" -- > "z is for zoo"
spellerize :: [Char] -> [Char]
spellerize word
 | length word == 0 = "nothing"
 | otherwise = (head word : " is for ") ++ word
