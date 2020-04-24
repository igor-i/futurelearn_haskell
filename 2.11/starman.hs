module Starman where

-- Example:
--
-- > starman "word" 3
-- > ----  ***
-- Enter your guess: r
-- --r-  ***
-- Enter your guess: w
-- w-r-  **
-- Enter your guess: o wor-  ***
-- Enter your guess: d
-- You win!

check :: String -> String -> Char -> (Bool, String)
check word display c
  = (c `elem` word, [if x==c
          then c
          else y | (x,y) <- zip word display])


turn :: String -> String -> Int -> IO ()
turn word display n =
  do if n==0
       then putStrLn "You lose"
       else if word==display
              then putStrLn "You win!"
              else mkguess word display n


mkguess word display n =
  do putStrLn (display ++ "  " ++ take n (repeat '*'))
     putStr "  Enter your guess: "
     q <- getLine
     let (correct, display') = check word display (q!!0)
     let n' = if correct then n else n-1
     turn word display' n'


starman :: String -> Int -> IO ()
starman word n = turn word ['-' | x <- word] n
