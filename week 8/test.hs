import Data.Char
import Data.List

data Suit = Hearts | Diamonds | Clubs | Spades
    deriving (Show, Eq)
type Pip = Int
data Court = Ace | Jack | Queen | King
    deriving (Show, Eq, Ord)
type Rank = Either Pip Court
data Card = Joker | Card Suit Rank
    deriving (Show, Eq)
type Deck = [Card]

removeJokers :: Deck -> Deck
removeJokers [] = []
removeJokers cards = filter (/= Joker) cards

filterOdd :: [Int] -> [Int]
filterOdd = filter odd

filterSquare :: [Int] -> [Int]
filterSquare = filter (\x2 -> (length [1 | x <- [1..((div x2 2) + 1)], x * x == x2] == 1))

filterPrime :: Int -> [Int] -> [Int]
filterPrime number xs = take number (filter (\x -> (length [1 | factor <- [1..(x + 1)], mod x factor == 0] == 2)) xs)


shout :: String -> String
shout = map (\single_char -> if isLower single_char then toUpper single_char else single_char)

whisper :: String -> String
whisper = map (\single_char -> if isUpper single_char then toLower single_char else single_char)

basicTitle :: String -> String
basicTitle string = unwords (map (\(x:xs) -> toUpper x : xs) (words string))

fancyTitle :: String -> String
fancyTitle string = unwords [if length [1 | candidate <- ["and", "the", "of"], (x:xs) == candidate] == 0
    then toUpper x : xs
    else x : xs
    | (x:xs) <- words string]


map' :: (a -> b) -> [a] -> [b]
map' f xs = [f x | x <- xs]

filter' :: (a -> Bool) -> [a] -> [a]
filter' f xs = [x | x <- xs, f x]


zip' :: [a] -> [b] -> [(a, b)]
zip' = zipWith (\a b -> (a, b))

compareSnd :: (Ord a, Ord b) => [(a, b)] -> [(a, b)]
compareSnd = sortBy (\(x1, y1) (x2, y2) -> compare y1 y2)

applyUntilStable :: Eq a => (a -> a) -> a -> a
applyUntilStable f x = if x == f x then x else applyUntilStable f (f x)


caesarShift :: (Int -> Int) -> String -> String
caesarShift func string = [chr (func (ord char)) | char <- string]

vigenereShift :: String -> String -> String
vigenereShift (_:plain) [] = error "code is not sufficient"
vigenereShift [] _ = []
vigenereShift (char:plain) (x:code)
    | (isUpper char || char == ' ') && isUpper x = chr (mod (ord char + ord x - 2 * ord 'A') 26 + ord 'A') : vigenereShift plain code
    | otherwise = error "input must be uppercase"