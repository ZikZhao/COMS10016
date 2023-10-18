function1 :: Int -> String
function1 x = "x"
function2 :: Bool -> String
function2 x = "Hello"


data Maybe' a = Just' a | Nothing'
    deriving (Show)

isJust :: Maybe' a -> Bool
isJust (Just' a) = True
isJust Nothing' = False

isNothing :: Maybe' a -> Bool
isNothing x = (not.isJust) x

safeDiv :: Int -> Int -> Maybe' Int
safeDiv x 0 = Nothing'
safeDiv x y = Just' (div x y)

fromMaybe :: a -> Maybe' a -> a
fromMaybe x (Just' a) = a
fromMaybe x Nothing' = x

perform :: (Int -> Int) -> Maybe' Int -> Maybe' Int
perform function (Just' x) = Just' (function x)
perform function (Nothing') = Nothing'



data Either' a b = Left' a | Right' b
    deriving(Show)

isLeft :: Either' a b -> Bool
isLeft (Left' a) = True
isLeft (Right' b) = False

isRight :: Either' a b -> Bool
isRight (Left' a) = False
isRight (Right' b) = True

safeDiv' :: Int -> Int -> Either' String Int
safeDiv' x 0 = Left' "Division by 0 is undefined"
safeDiv' x y = Right' (div x y)

fromEither :: (a -> c) -> (b -> c) -> Either' a b -> c
fromEither func1 func2 (Left' x) = func1 x
fromEither func1 func2 (Right' x) = func2 x

type Maybe'' a = Either' (Maybe' a) (Maybe' a)

toMay :: Maybe'' a -> Maybe' a
toMay (Left' (Just' x)) = Just' x
toMay (Right' Nothing') = Nothing'

fromMay :: Maybe' a -> Maybe'' a
fromMay (Just' x) = Left' (Just' x)
fromMay Nothing' = Right' Nothing'



data RPS = Rock | Paper | Scissors
    deriving (Show, Eq)

shoot :: RPS -> RPS -> Bool
shoot Paper Rock = True
shoot Rock Scissors = True
shoot Scissors Paper = True
shoot x y = False

instance Ord RPS where
    (<=) x y = (not.(shoot x)) y

-- law of transitivity is breaked



data Suit = Diamonds | Clubs | Hearts | Spades
    deriving (Show, Eq)
data Court = Ace | Jack | Queen | King
    deriving (Show, Eq, Ord)
type Pip = Int
type Rank = Either Pip Court
data Card = Joker | Card Suit Rank
    deriving Show

instance Eq Card where
    (==) Joker Joker = True
    (==) (Card suit1 (Left pip1)) (Card suit2 (Left pip2)) = suit1 == suit2 && pip1 == pip2
    (==) (Card suit1 (Right court1)) (Card suit2 (Right court2)) = suit1 == suit2 && court1 == court2
    (==) (Card suit1 x) (Card suit2 y) = False

snap :: Card -> Card -> String
snap Joker Joker = "SNAP"
snap (Card suit1 (Left pip1)) (Card suit2 (Left pip2))
    | pip1 == pip2 = "SNAP"
    | otherwise = "NOT SNAP"
snap (Card suit1 (Right court1)) (Card suit2 (Right court2))
    | court1 == court2 = "SNAP"
    | otherwise = "NOT SNAP"
snap (Card suit1 x) (Card suit2 y) = "NOT SNAP"

instance Ord Card where
    (>) Joker _ = True
    (>) (Card Spades x) (Card Spades y) = False
    (>) (Card Spades x) (Card _ y) = True
    (>) (Card Hearts x) (Card Hearts y) = False
    (>) (Card Hearts x) (Card _ y) = True
    (>) (Card suit1 (Right Ace)) (Card suit2 _) = False
    (>) (Card suit1 (Right x)) (Card suit2 (Left y)) = True
    (>) (Card suit1 (Left pip1)) (Card suit2 (Left pip2)) = pip1 > pip2
    (>) (Card suit1 (Right court1)) (Card suit2 (Right court2)) = court1 > court2
    (>) x y = not (y > x)
    (<=) x y = not (x > y)