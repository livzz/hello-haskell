module Main where

import Lib
  ( Client (Company, Individual),
    Gender (Male),
    Person (..),
    clientName,
    companyName,
    firstOrEmpty,
    maxmin1,
    reverse2,
    someFunc,
    (+++),
  )

-- import Lib (firstOrEmpty)

person1 :: Person
person1 = Person "hello" "world" Male

client1 :: Client
client1 = Individual person1 True

client2 :: Client
client2 = Company "Google" 12131 "Sundar Prechai" "CEO"

main :: IO ()
main = do
  putStrLn (firstOrEmpty ["Hello", "World"])
  putStrLn (firstOrEmpty [])
  someFunc (firstOrEmpty ["Hello"])
  print ([1, 2] +++ [4, 5, 6])
  print (reverse2 [1, 2, 3, 4, 5])
  print (maxmin1 [1, 2, 3, 4, 5])
  print client1
  print (clientName client1)
  print (companyName client1)
  print (companyName client2)

-- someFunc (firstOrEmpty ["Hello", "World"])
-- firstOrEmpty
