module Main where

import Lib

-- import Lib (firstOrEmpty)

main :: IO ()
main = do
  putStrLn (firstOrEmpty ["Hello", "World"])
  putStrLn (firstOrEmpty [])
  someFunc (firstOrEmpty ["Hello"])

-- someFunc (firstOrEmpty ["Hello", "World"])
-- firstOrEmpty
