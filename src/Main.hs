{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Data.String
import           Network.HTTP.Types
import           Network.Wai
import           Network.Wai.Handler.Warp
import           System.Environment
import           Text.Blaze.Html.Renderer.Pretty
import qualified Text.Blaze.Html5                as H
import qualified Text.Blaze.Html5.Attributes     as A
import           Web.Simple.Controller

index :: H.Html
index = H.docTypeHtml $ do
  H.head $ do
    H.title "Seagull"
  H.body $ do
    H.h1 "Hello world!"
    H.p "Hello, friend"

main :: IO ()
main = do
  port <- maybe 8000 read <$> lookupEnv "PORT"
  run port $ controllerApp () $ do
    routeTop . respond $ responseLBS status200 [(hContentType, "text/html")] (fromString . renderHtml $ index)
