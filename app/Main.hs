module Main where

import Lib
  ( Client (Company, Individual),
    Gender (Female, Male),
    Person (..),
    clientCount,
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

person2 :: Person
person2 = Person "hello" "world" Female

client1 :: Client
client1 = Individual person1 True

client2 :: Client
client2 = Company "Google" 12131 "Sundar Prechai" "CEO"

client3 :: Client
client3 = Individual person2 True

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
  print (clientCount [client1, client2, client3, client3, client2, client1])

-- someFunc (firstOrEmpty ["Hello", "World"])
-- firstOrEmpty
