import Test.QuickCheck

nats :: [Integer]
nats = [1..]

squares :: [Integer]
squares = [x * x | x <- nats]

odds :: [Integer]
odds = [x | x <- nats, mod x 2 == 1]

cartesian :: [a] -> [b] -> [(a, b)]
cartesian xs ys = [(x, y) | x <- xs, y <- ys]

bitString :: Integer -> [String]
bitString 0 = []
bitString 1 = ["0", "1"]
bitString n = [ value ++ original | original <- bitString (n - 1), value <- ["0", "1"]]

bitStrings :: Integer -> [String]
bitStrings 0 = []
bitStrings 1 = ["0", "1"]
bitStrings n = bitStrings (n - 1) ++ bitString n



data List a = Empty | Cons a (List a)
    deriving Eq

toList :: [a] -> List a
toList [] = Empty
toList (x:xs) = Cons x (toList xs)

fromList :: List a -> [a]
fromList Empty = []
fromList (Cons a list) = a : fromList list

prop_TestFromList xs = fromList (toList xs) == xs

prop_TestRepeat x n = n >= 0 ==> length (take n (repeat x)) == n

prop_TestReverse xs ys = reverse (xs ++ ys) == reverse ys ++ reverse xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' [x] = [x]
reverse' xs = last xs : reverse' (take (length xs - 1) xs)

test :: Int -> Int
test x = x + 2

twice :: (a -> a) -> a -> a
twice f x = f (f x)

infinity :: Integer
infinity = 1 + infinity