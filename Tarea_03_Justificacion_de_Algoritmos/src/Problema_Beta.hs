module Problema_Beta where

sumaPrimerosN :: Int -> Int
sumaPrimerosN 1 = 3
sumaPrimerosN n = n * 3 + sumaPrimerosN (n - 1)