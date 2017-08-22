module Main where

import           Network.Wai
import           Network.Wai.Handler.Warp
import           System.Environment
import           Web.Simple.Controller

import           Seagull

authMiddleware :: Middleware
authMiddleware = id

main :: IO ()
main = do
  port <- maybe 8000 read <$> lookupEnv "PORT"
  let defaultState = SState False
  let app = controllerApp defaultState seagull
  run port $ authMiddleware app
