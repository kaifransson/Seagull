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
                     authSettings = "The sea" { authIsProtected = isProtected }
                  in basicAuth checkCreds authSettings

isProtected :: Request -> IO Bool
isProtected = return . (=="POST") . requestMethod

main :: IO ()
main = do
  port <- maybe 8000 read <$> lookupEnv "PORT"
  run port $ authMiddleware $ controllerApp () seagull
