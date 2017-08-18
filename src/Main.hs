{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Network.HTTP.Types
import           Network.Wai
import           Network.Wai.Handler.Warp
import           System.Environment
import           Web.Simple.Controller

main :: IO ()
main = do
  port <- maybe 8000 read <$> lookupEnv "PORT"
  run port $ controllerApp () $ do
    routeTop . respond $ responseLBS status200 [(hContentType, "text/plain")] "Hello world!"
