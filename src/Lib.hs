module Lib where

someFunc :: [Char] -> IO ()
someFunc = putStrLn

someFunc1 :: [Char] -> IO ()
someFunc1 = putStrLn

firstOrEmpty :: [[Char]] -> [Char]
firstOrEmpty lst = if not (null lst) then head lst else "empty"
