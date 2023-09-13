module Problema_Alpha where

productoElementos :: [Int] -> Int
productoElementos [x] = x
productoElementos (x:xs) = x * productoElementos xs
