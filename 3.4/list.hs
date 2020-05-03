module List where

-- length [] = 0
-- length x:xs = 1 + length xs

length' lst =
  if lst == []
    then 0
    else let x:xs = lst in 1 + length' xs

length'' lst
  | lst == [] = 0
  | otherwise = let
                  x:xs = lst
                in
                  1 + length'' xs

filter' fn lst = let
                    iter acc [] = acc
                    iter acc (x:xs)
                      | fn x = iter (acc ++ [x]) xs
                      | otherwise = iter acc xs
                  in
                    iter [] lst

filter'' fn lst
  | null lst = []
  | otherwise = if fn x
    then x:filter'' fn xs
    else filter'' fn xs
      where x:xs = lst
