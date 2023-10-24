removerepeat :: Eq a => a -> [a] -> [a]
removerepeat x [] = []
removerepeat x [y] = [y]
removerepeat x (y:xs)
    | x == y = x : [y | y <- xs, y /= x]
    | otherwise = y : removerepeat x xs

permutation :: [Int] -> [[Int]]
permutation [] = []
permutation (x:xs) = [(take index1 (permutation xs !! index2)) ++ (x : last ((length xs) - index1) (permutation xs !! index2)) |
                      index1 <- [0..length xs],
                      index2 <- [0..((length (permutation xs)) - 1)]]