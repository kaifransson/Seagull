{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Network.HTTP.Types
import           Network.Wai
import           Network.Wai.Handler.Warp
import           Web.Simple.Controller

main :: IO ()
main = run 80 $ controllerApp () $ do
  routeTop . respond $ responseLBS status200 [(hContentType, "text/plain")] "Hello world!"
