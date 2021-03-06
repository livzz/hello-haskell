module Lib where

someFunc :: [Char] -> IO ()
someFunc = putStrLn

someFunc1 :: [Char] -> IO ()
someFunc1 = putStrLn

firstOrEmpty :: [[Char]] -> [Char]
firstOrEmpty lst = if not (null lst) then head lst else "empty"

lst1 +++ lst2 =
  if null lst1 {- check emptyness -}
    then lst2 -- base case
    else (head lst1) : (tail lst1 +++ lst2)

reverse2 :: [a] -> [a]
reverse2 list =
  if null list
    then []
    else reverse2 (tail list) +++ [head list]

maxmin list =
  if null (tail list)
    then (head list, head list)
    else
      ( if head list > fst (maxmin (tail list))
          then head list
          else fst (maxmin (tail list)),
        if head list < snd (maxmin (tail list))
          then head list
          else snd (maxmin (tail list))
      )

maxmin1 :: Ord a => [a] -> (a, a)
maxmin1 list =
  let h = head list
   in if null (tail list)
        then (h, h)
        else (if h > t_max then h else t_max, if h < t_min then h else t_min)
  where
    t = maxmin (tail list)
    t_max = fst t
    t_min = snd t

data Gender = Male | Female | Unknown
  deriving (Show)

data Person = Person String String Gender
  deriving (Show)

data Client
  = GovOrg String
  | Company String Integer String String
  | Individual Person Bool
  deriving (Show)

clientName :: Client -> String
clientName client = case client of
  GovOrg name -> name
  Company name id person resp -> name
  Individual person ads ->
    case person of
      Person fNm lNm gender -> fNm ++ " " ++ lNm

clientName1 :: Client -> String
clientName1 client = case client of
  GovOrg name -> name
  Company name _ _ _ -> name
  Individual (Person firstName lastName _) _ -> firstName ++ " " ++ lastName

companyName :: Client -> Maybe String
companyName client = case client of
  Company name _ _ _ -> Just name
  _ -> Nothing

fibonacci :: Integer -> Integer
fibonacci n = case n of
  0 -> 0
  1 -> 1
  _ -> fibonacci (n - 1) + fibonacci (n - 2)

ifibonacci n | n < 0 = Nothing
ifibonacci 0 = Just 0
ifibonacci 1 = Just 1
ifibonacci n =
  let Just f1 = ifibonacci (n - 1)
      Just f2 = ifibonacci (n - 2)
   in Just (f1 + f2)

data Genders = Genders Integer Integer
  deriving (Show)

clientCount clients =
  if null clients
    then (0, 0)
    else case head clients of
      GovOrg {} -> t
      Company {} -> t
      Individual per _ ->
        case per of
          Person _ _ Male -> (male + 1, female)
          Person _ _ Female -> (male, female + 1)
          Person {} -> t
  where
    t = clientCount (tail clients)
    male = fst t
    female = snd t

sorted :: [Integer] -> Bool
sorted [] = True
sorted [_] = True
-- sorted (x : y : zs) = x < y && sorted (y : zs)
sorted (x : r@(y : zs)) = x < y && sorted r

maxmin2 [x] = (x, x)
maxmin2 (x : xs) =
  ( if x > xs_max then x else xs_max,
    if x < xs_min then x else xs_min
  )
  where
    (xs_max, xs_min) = maxmin xs

multipleOf :: Integer -> Integer -> Bool
multipleOf x y = (mod x y) == 0

specialMultiples :: Integer -> String
specialMultiples n | multipleOf n 2 = show n ++ " is multiple of 2"
specialMultiples n | multipleOf n 3 = show n ++ " is multiple of 3"
specialMultiples n | multipleOf n 5 = show n ++ " is multiple of 5"
specialMultiples n | otherwise = show n ++ " is a beautiful number"

specialMultiples1 n
  | multipleOf n 2 = show n ++ " is multiple of 2"
  | multipleOf n 3 = show n ++ " is multiple of 3"
  | multipleOf n 5 = show n ++ " is multiple of 5"
  | otherwise = show n ++ " is a beautiful number"
