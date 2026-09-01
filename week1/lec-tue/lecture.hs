double :: Int -> Int
double x = x * 2

data List a
  = Nil
  | Cons a (List a)
  deriving (Eq, Show)

listLength :: List a -> Int
listLength l =
  case l of
    Nil -> 0
    Cons _ xs -> 1 + listLength xs

element :: (Eq a) => a -> List a -> Bool
element x l =
  case l of
    Nil -> False
    Cons y ys ->
      if x == y
        then True
        else element x ys

lookupElement ::
  (Eq a) => a -> List a -> Maybe a
lookupElement _ Nil = Nothing
lookupElement x (Cons y ys) =
  if x == y
    then Just y
    else lookupElement x ys

instance Functor List where
  fmap _ Nil = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)

instance Foldable List where
  -- foldr :: (a -> b -> b) -> b -> List a -> b
  foldr _ acc Nil = acc
  foldr op acc (Cons x xs) =
    foldr op (op x acc) xs

data Q u = Q Double
  deriving (Show)

instance Num (Q u) where
  Q x + Q y = Q (x + y)
  Q x * Q y = Q (x * y)
  negate (Q x) = Q (-x)
  abs (Q x) = Q (abs x)
  signum (Q x) = Q (signum x)
  fromInteger x = Q (fromInteger x)

data Kg

data MetersPerSecond

data Joules

someMass :: Q Kg
someMass = Q 3

someVelocity :: Q MetersPerSecond
someVelocity = Q 9.82

energy :: Q Kg -> Q MetersPerSecond -> Q Joules
energy (Q mass) (Q velocity) =
  Q (mass * (velocity * velocity) / 2)
