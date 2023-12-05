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