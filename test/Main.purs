module Test.Main where

import Prelude

import Control.Monad.ST as ST
import Control.Monad.ST.Ref as STRef
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assertEqual)

--------------------------------------------------------------------------------
-- STRef ----------------------------------------------------------------------

-- | A fresh ref reads back its initial value.
newRead :: Int
newRead = ST.run (STRef.new 7 >>= STRef.read)

-- | `write` replaces the cell and a later `read` observes the new value.
writeThenRead :: Int
writeThenRead = ST.run do
  ref <- STRef.new 1
  _ <- STRef.write 42 ref
  STRef.read ref

-- | `modify` returns the updated value.
modifyReturnsNew :: Int
modifyReturnsNew = ST.run do
  ref <- STRef.new 10
  STRef.modify (_ + 5) ref

-- | `modify'` returns the chosen `value`...
modifyPrimeValue :: Int
modifyPrimeValue = ST.run do
  ref <- STRef.new 5
  STRef.modify' (\s -> { state: s + 1, value: s * 10 }) ref

-- | ...and stores the chosen `state`.
modifyPrimeState :: Int
modifyPrimeState = ST.run do
  ref <- STRef.new 5
  _ <- STRef.modify' (\s -> { state: s + 1, value: s * 10 }) ref
  STRef.read ref

--------------------------------------------------------------------------------
-- run + recursion ------------------------------------------------------------

-- | Sum of squares 1..100 (= 338350), driven by a mutable `STRef` in a
-- | recursive loop. Exercises `new`, `read`, `modify` and `run` together.
sumOfSquares :: Int
sumOfSquares = ST.run do
  total <- STRef.new 0
  let
    loop 0 = STRef.read total
    loop n = do
      _ <- STRef.modify (_ + (n * n)) total
      loop (n - 1)
  loop 100

--------------------------------------------------------------------------------
-- ST.for ---------------------------------------------------------------------

-- | `ST.for lo hi` runs `hi` exclusive, so summing the indices of `for 0 5`
-- | is 0+1+2+3+4 = 10, not 15. Guards against an off-by-one that includes `hi`.
forSumExclusive :: Int
forSumExclusive = ST.run do
  acc <- STRef.new 0
  ST.for 0 5 \i -> void (STRef.modify (_ + i) acc)
  STRef.read acc

-- | `ST.for lo hi` runs `lo` inclusive, so `for 3 4` executes exactly once.
forIterationCount :: Int
forIterationCount = ST.run do
  acc <- STRef.new 0
  ST.for 3 4 \_ -> void (STRef.modify (_ + 1) acc)
  STRef.read acc

-- | An empty range (`hi == lo`) runs zero times.
forEmptyRange :: Int
forEmptyRange = ST.run do
  acc <- STRef.new 0
  ST.for 2 2 \_ -> void (STRef.modify (_ + 1) acc)
  STRef.read acc

--------------------------------------------------------------------------------
-- ST.while / ST.foreach ------------------------------------------------------

-- | `ST.while` repeats the body while the condition holds; counting up from
-- | 0 while `< 5` stops at exactly 5.
whileCountUp :: Int
whileCountUp = ST.run do
  ref <- STRef.new 0
  ST.while (map (_ < 5) (STRef.read ref)) (void (STRef.modify (_ + 1) ref))
  STRef.read ref

-- | `ST.foreach` visits every element of the array exactly once.
foreachSum :: Int
foreachSum = ST.run do
  acc <- STRef.new 0
  ST.foreach [ 1, 2, 3, 4 ] \x -> void (STRef.modify (_ + x) acc)
  STRef.read acc

--------------------------------------------------------------------------------
-- Entry point ----------------------------------------------------------------

main :: Effect Unit
main = do
  assertEqual { actual: newRead, expected: 7 }
  assertEqual { actual: writeThenRead, expected: 42 }
  assertEqual { actual: modifyReturnsNew, expected: 15 }
  assertEqual { actual: modifyPrimeValue, expected: 50 }
  assertEqual { actual: modifyPrimeState, expected: 6 }
  assertEqual { actual: sumOfSquares, expected: 338350 }
  assertEqual { actual: forSumExclusive, expected: 10 }
  assertEqual { actual: forIterationCount, expected: 1 }
  assertEqual { actual: forEmptyRange, expected: 0 }
  assertEqual { actual: whileCountUp, expected: 5 }
  assertEqual { actual: foreachSum, expected: 10 }
  log "purescript-lua-st: all ST tests passed"
