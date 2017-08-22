{-# LANGUAGE OverloadedStrings #-}

module Seagull ( seagull
               , SeagullController )
               where

import           Data.String
import           Network.HTTP.Types
import           Network.HTTP.Types.Method
import           Network.Wai
import           Text.Blaze.Html.Renderer.Pretty
import           Web.Simple.Controller

import           Content

type SeagullController = Controller ()

seagull :: SeagullController ()
seagull = do
  let content = fromString . renderHtml . index
  let respondIndex = respond . responseLBS status200 [(hContentType, "text/html")] . content
  routeTop $ do
    routeMethod GET $ respondIndex showButton
    routeMethod POST $ respondIndex (secret False)
