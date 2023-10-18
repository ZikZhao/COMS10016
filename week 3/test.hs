first :: (type1, type2) -> type1
first (x, y) = x

copy :: a -> (a, a)
copy x = (x, x)

const :: a -> b -> a
const x y = x

apply :: (a -> b) -> a -> b
apply f x = f x



class AddTwo type1 where
    addTwo :: type1 -> type1

instance AddTwo Real where
    addTwo x = x + 2


grade :: Int -> String
grade x
    | x >= 70 = "First Class Honours"
    | x >= 40 = "Second Class Honours"
    | otherwise = "Failed"

orientation :: Int -> Int -> String
orientation width height
    | width > height = "Landscape"
    | height > width = "Portrait"
    | otherwise = "Square"

triangle :: (Int, Int, Int) -> String
triangle (x, y, z)
    | x == y && y == z = "Equilateral"
    | x == y || y == z || z == x = "Isosceles"
    | otherwise = "Scalene"

pi :: Integer -> Float
