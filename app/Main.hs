module Main where

import           Network.Wai.Handler.Warp
import           System.Environment
import           Web.Simple.Controller

import           Seagull

main :: IO ()
main = do
  port <- maybe 8000 read <$> lookupEnv "PORT"
  let defaultState = SState False
  run port $ controllerApp defaultState seagull
