module LiquidHaskell.ProofCombinators (

  --  Proof is just the unit type 

  Proof, 

  --    Proof Construction 

  trivial, QED(..), (***), 

  -- Equational Reasoning

  (==.), (==?), (?),

  --  Using Proofs 

  withTheorem

  ) where 

type Proof = ()

trivial :: Proof 
trivial = ()


data QED = QED 

infixl 2 ***
x *** QED = () 
 


-- | Equational Reasoning 

-- use (==?) to check intermediate steps 
-- use (==.) not to check intermediate steps 

infixl 3 ==., ==?

(==.) :: a -> a -> a 
_ ==. x = x 
{-# INLINE (==.) #-} 


{-@ (==?) :: x:a -> y:{a | x == y} -> {v:a | v == y && v == x} @-}
(==?) :: a -> a -> a 
_ ==? x = x 
{-# INLINE (==?) #-} 

-- Explanations: embed a proof into a term

infixl 3 ?
(?) :: a -> Proof -> a 
x ? _ = x 
{-# INLINE (?)   #-} 

-- | Using Proofs 

withTheorem :: a -> Proof -> a 
withTheorem z _ = z 