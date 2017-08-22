{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Network.Wai.Handler.Warp
import           System.Environment

import           Seagull

main :: IO ()
main = do
  port <- maybe 8000 read <$> lookupEnv "PORT"
  run port $ seagull ()
