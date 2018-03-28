-- Use theorem proving to define correct by construction functions 

module LiquidHaskell.Derivations (

  -- * Defined, (^^^)

) where 


data Defined = Defined

infixl 2 ^^^
x ^^^ Defined = x
{-# INLINE (^^^) #-} 
