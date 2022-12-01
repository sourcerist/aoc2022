{-# LANGUAGE ScopedTypeVariables #-}
module Problem1 (problem1a, problem1b) where

import Data.List
import Data.Function

splitOnEmpty :: [String] -> [[String]]
splitOnEmpty [] = []
splitOnEmpty ("":xs) = splitOnEmpty xs
splitOnEmpty xs = takeWhile (/="") xs : (splitOnEmpty . dropWhile (/="")) xs

problem1a :: IO ()
problem1a = do
    str <- readFile "./data/1a.txt"
    let xs :: [Int] = fmap (sum . fmap read) . splitOnEmpty . lines $ str
    print . maximum $ xs

problem1b :: IO ()
problem1b = do
    str <- readFile "./data/1a.txt"
    let xs :: [Int] = fmap (sum . fmap read) . splitOnEmpty . lines $ str
    print . sum . take 3 . reverse . sort $ xs

