module Main where

import System.Environment
import Problem1
import Problem2

run ["1a"] = problem1a
run ["1b"] = problem1b
run ["2a"] = problem2a
run ["2b"] = problem2b

main :: IO ()
main = getArgs >>= run
