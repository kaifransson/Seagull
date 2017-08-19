{-# LANGUAGE OverloadedStrings #-}

module Seagull ( seagull ) where

import           Data.String
import           Network.HTTP.Types
import           Network.Wai
import           Text.Blaze.Html.Renderer.Pretty
import qualified Text.Blaze.Html5                as H
import qualified Text.Blaze.Html5.Attributes     as A
import           Web.Simple.Controller

type SeagullController = Controller ()

index :: H.Html
index = H.docTypeHtml $ do
  H.head $ do
    H.title "Seagull"
  H.body $ do
    H.h1 "Hello world!"
    H.p "Hello, friend"

seagull :: SeagullController ()
seagull = routeTop . respond $ responseLBS status200 [(hContentType, "text/html")] (fromString . renderHtml $ index)
