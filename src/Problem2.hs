{-# LANGUAGE ScopedTypeVariables #-}
module Problem2 (problem2a, problem2b) where

import Data.Set (Set)
import qualified Data.Set as Set
import Data.Map (Map, (!))
import qualified Data.Map as Map

playScore 'X' = 1
playScore 'Y' = 2
playScore 'Z' = 3


winLoseDraw :: Num a => (Char, Char) -> a
winLoseDraw play  
    | play `Set.member` weWin = 6
    | play `Set.member` draw = 3
    | otherwise = 0 where
        weWin = Set.fromList (zip "ABC" "YZX")
        draw = Set.fromList (zip "ABC" "XYZ")

getPlay [them,' ',us] = (them, us)

problem2a :: IO ()
problem2a = do
    str <- readFile "./data/2a.txt"
    let xs  = fmap getPlay . lines $ str
    let result = (sum . fmap winLoseDraw) xs + (sum . fmap (playScore . snd)) xs
    print result

determinePlay (them,desiredResult) = (them, ourPlay) where
    ourPlay =
        case desiredResult of 
        'X' -> loses ! them
        'Y' -> ties ! them
        'Z' -> wins ! them 
    wins = Map.fromList (zip "ABC" "YZX")
    ties = Map.fromList (zip "ABC" "XYZ")
    loses = Map.fromList (zip "ABC" "ZXY")

problem2b = do
    str <- readFile "./data/2a.txt"
    let xs  = fmap (determinePlay . getPlay) . lines $ str
    let result = (sum . fmap winLoseDraw) xs + (sum . fmap (playScore . snd)) xs
    print result


