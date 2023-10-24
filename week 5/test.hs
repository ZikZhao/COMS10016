data Expr = Num Int
    | Add Expr Expr
    | Sub Expr Expr
    | Mul Expr Expr
    | Div Expr Expr

expr = Add (Mul (Num 1) (Num 2)) (Mul (Num 3) (Num 4))

size :: Expr -> Int
size (Num num) = 0
size (Add expr1 expr2) = 1 + size expr1 + size expr2
size (Sub expr1 expr2) = 1 + size expr1 + size expr2
size (Mul expr1 expr2) = 1 + size expr1 + size expr2
size (Div expr1 expr2) = 1 + size expr1 + size expr2

eval :: Expr -> Int
eval (Num num) = num
eval (Add expr1 expr2) = eval expr1 + eval expr2
eval (Sub expr1 expr2) = eval expr1 - eval expr2
eval (Mul expr1 expr2) = eval expr1 * eval expr2
eval (Div expr1 (Num 0)) = error "division by 0 is invalid"
eval (Div expr1 expr2) = div (eval expr1) (eval expr2)

instance Show Expr where
    show (Num num) = show num
    show (Add expr1 expr2) = show expr1 ++ " + " ++ show expr2
    show (Sub expr1 expr2) = show expr1 ++ " - " ++ show expr2
    show (Mul expr1 expr2) = show expr1 ++ " * " ++ show expr2
    show (Div expr1 expr2) = show expr1 ++ " / " ++ show expr2

eval2 :: Expr -> Maybe Int
eval2 (Num num) = Just num
eval2 (Add expr1 expr2) = Just (eval expr1 + eval expr2)
eval2 (Sub expr1 expr2) = Just (eval expr1 - eval expr2)
eval2 (Mul expr1 expr2) = Just (eval expr1 * eval expr2)
eval2 (Div expr1 (Num 0)) = Nothing
eval2 (Div expr1 expr2) = Just (div (eval expr1) (eval expr2))



length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length' xs

sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

fromJusts :: [Maybe a] -> [a]
fromJusts [] = []
fromJusts (Just a:xs) = a : fromJusts xs

insert :: Int -> [Int] -> [Int]
insert x [] = [x]
insert x (y:ys)
    | x <= y = x:(y:ys)
    | otherwise = y : insert x ys

isort :: [Int] -> [Int]
isort [x] = [x]
--isort xs = insert (xs !! (length' xs - 1)) (isort (take ((length' xs) - 1) xs))
isort (x:xs) = insert x (isort xs)

merge :: [Int] -> [Int] -> [Int]
merge [] [] = []
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
    | x <= y = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys

split :: [a] -> ([a], [a])
split [] = ([], [])
split (x:xs) =
    if length' (fst (split xs)) >= length' (snd (split xs))
        then (fst (split xs), x : snd (split xs))
        else (x : fst (split xs), snd (split xs))



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
removeJokers (card:cards)
    | card == Joker = removeJokers cards
    | otherwise = (card : removeJokers cards)

dealPokerHand :: Deck -> [Card]
dealPokerHand (a:b:c:d:e:xs) = [a, b, c, d, e]

deal :: Int -> Deck -> [[Card]]
deal number [] = [[]]
deal number deck
    | length' deck <= number = [[x] | x <- deck] ++ replicate (number - length' deck) []
    | otherwise = [((take number deck) !! index) : ((deal number (drop number deck)) !! index) | index <- [0..(number - 1)]]
