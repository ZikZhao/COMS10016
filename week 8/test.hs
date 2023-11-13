filter :: (a -> Bool) ->[a] ->[a]
filter p [] = []
filter p (x:xs)
    | p x = x : filter p xs
    | otherwise = filter p xs

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