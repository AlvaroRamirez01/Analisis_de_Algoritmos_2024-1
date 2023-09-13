module Problema_Beta where

sumaPrimerosN :: Int -> Int
sumaPrimerosN 0 = 0
sumaPrimerosN n
    | mod n 3 == 0 = n + sumaPrimerosN (n - 1)
    | otherwise = sumaPrimerosN (n - 1)