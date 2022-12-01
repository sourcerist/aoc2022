module Main where

import System.Environment
import Problem1

run ["1a"] = problem1a
run ["1b"] = problem1b

main :: IO ()
main = getArgs >>= run
