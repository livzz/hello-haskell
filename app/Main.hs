module Main where

import Lib

-- import Lib (firstOrEmpty)

main :: IO ()
main = do
  putStrLn (firstOrEmpty ["Hello", "World"])
  putStrLn (firstOrEmpty [])
  someFunc (firstOrEmpty ["Hello"])
  print ([1, 2] +++ [4, 5, 6])
  print (reverse2 [1, 2, 3, 4, 5])
  print (maxmin1 [1, 2, 3, 4, 5])

-- someFunc (firstOrEmpty ["Hello", "World"])
-- firstOrEmpty
