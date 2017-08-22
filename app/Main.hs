{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Network.Wai
import           Network.Wai.Handler.Warp
import           Network.Wai.Middleware.HttpAuth
import           System.Environment
import           Web.Simple.Controller

import           Seagull

authMiddleware :: Middleware
authMiddleware = let checkCreds u p = return $ u == "test" && p == "pw"
                     authSettings = "The sea" { authIsProtected = const . return $ True }
                  in basicAuth checkCreds authSettings

main :: IO ()
main = do
  port <- maybe 8000 read <$> lookupEnv "PORT"
  let defaultState = SState False
  let app = controllerApp defaultState seagull
  run port $ authMiddleware app
