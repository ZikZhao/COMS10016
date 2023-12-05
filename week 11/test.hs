data Maybe' type1 = Just' type1 | Nothing'
    deriving (Eq, Show)
data Either' type1 type2 = Left' type1 | Right' type2
    deriving (Eq, Show)

instance Functor Maybe' where
    fmap f Nothing' = Nothing'
    fmap f (Just' value) = Just' (f value)

instance Functor (Either' type1) where
    fmap f (Left' value) = Left' value
    fmap f (Right' value) = Right' (f value)

instance Applicative Maybe' where
    pure = Just'
    (<*>) (Just' f) (Just' a) = Just' (f a)
    (<*>) _ _ = Nothing'

instance Applicative (Either' type1) where
    pure = Right'
    (<*>) (Right' f) (Right' a) = Right' (f a)
    (<*>) (Left' f) _ = Left' f
    (<*>) (Right' f) (Left' a) = Left' a

fmapAp :: Applicative f => (a -> b) -> f a -> f b
fmapAp f x = pure f <*> x

liftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
liftA2 f a b = (fmap f a) <*> b

instance Monad Maybe' where
    (>>=) (Just' a) f = f a
    (>>=) Nothing' f = Nothing'

instance Monad (Either' type1) where
    (>>=) (Left' message) f = Left' message
    (>>=) (Right' value) f = f value

safeDiv :: Int -> Int -> Either' String Int
safeDiv x 0 = Left' ("Tried to divide "++show x++" by 0")
safeDiv x y = Right' (div x y)

safeDiv2 :: Int -> Int -> Int -> Either' String Int
safeDiv2 x y z = safeDiv x y >>= (\result -> safeDiv result z)

safeDivAll :: Int -> [Int] -> Either' String Int
safeDivAll x [] = Right' x
safeDivAll x (y:ys) = safeDiv x y >>= (\z -> safeDivAll z ys)

data Tree a = Leaf a | Branch (Tree a) (Tree a)
    deriving (Eq, Show)

newtype Reader a b = MkReader (a -> b)

instance Functor Tree where
    fmap f (Leaf a) = Leaf (f a)
    fmap f (Branch tree1 tree2) = Branch (fmap f tree1) (fmap f tree2)

instance Applicative Tree where
    pure = Leaf
    (Leaf f) <*> (Leaf a) = Leaf (f a)
    --(Leaf f) <*> (Branch tree1 tree2) = Branch ((Leaf f) <*> tree1) ((Leaf f) <*> tree2)
    (Leaf f) <*> (Branch tree1 tree2) = error ""
    (Branch tree1 tree2) <*> (Leaf a) = error ""
    (Branch tree1 tree2) <*> (Branch tree3 tree4) = Branch (tree1 <*> tree3) (tree2 <*> tree4)

instance Functor (Reader type1) where
    fmap :: (a -> b) -> Reader type1 a -> Reader type1 b
    fmap f (MkReader f2) = MkReader (f . f2)

instance Applicative (Reader type1) where
    pure f = MkReader (\x -> f)
    (MkReader f1) <*> (MkReader f2) = MkReader (\x -> (f1 x) (f2 x))

doTwice :: Applicative f => f a -> f (a, a)
doTwice = fmap (\x -> (x, x))

sequenceAp :: Applicative f => [f a] -> f [a]
sequenceAp xs = foldr (<*>) (pure []) ([pure (:) <*> x | x <- xs])