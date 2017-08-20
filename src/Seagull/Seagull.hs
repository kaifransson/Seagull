{-# LANGUAGE OverloadedStrings #-}

module Seagull ( seagull
               , SeagullController )
               where

import           Data.String
import           Network.HTTP.Types
import           Network.Wai
import           Text.Blaze.Html.Renderer.Pretty
import           Web.Simple.Controller

import           Content

type SeagullController = Controller ()

seagull :: SeagullController ()
seagull = do
  let content = fromString . renderHtml . index $ showButton
  let response = responseLBS status200 [(hContentType, "text/html")] content
  routeTop . respond $ response
