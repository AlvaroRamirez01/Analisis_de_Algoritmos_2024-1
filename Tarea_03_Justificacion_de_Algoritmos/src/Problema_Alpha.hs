module Problema_Alpha where

productoElementos :: [Int] -> Int
productoElementos [] = 1
productoElementos [x] = x * productoElementos []
productoElementos (x:xs) = x * productoElementos xs
