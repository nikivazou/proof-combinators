{-@ LIQUID "--exactdc" @-}
{-@ LIQUID "--higherorder" @-}

module Reverse where 

import LiquidHaskell.ProofCombinators 
import Prelude hiding (reverse, (++), length)

{-@ measure length @-}
{-@ length :: [a] -> Nat @-} 
length :: [a] -> Int 
length []     = 0 
length (_:xs) = 1 + length xs

{-@ infix   : @-}
{-@ reflect reverse @-}
{-@ reverse :: is:[a] -> {os:[a] | length is == length os} @-}
reverse :: [a] -> [a]
reverse []     = []
reverse (x:xs) = reverse xs ++ [x]

{-@ infix   ++ @-}
{-@ reflect ++ @-}
{-@ (++) :: xs:[a] -> ys:[a] -> {os:[a] | length os == length xs + length ys} @-}
(++) :: [a] -> [a] -> [a]
[]     ++ ys = ys
(x:xs) ++ ys = x:(xs ++ ys)


singletonP :: a -> Proof
{-@ singletonP :: x:a -> { reverse [x] == [x] } @-}
singletonP x
  =   reverse [x]
  ==. reverse [] ++ [x]
  ==. [] ++ [x]
  ==. [x]
  *** QED 
