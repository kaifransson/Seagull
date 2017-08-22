{-# LANGUAGE OverloadedStrings #-}

module Seagull ( seagull
               , SeagullController
               , SeagullState(SState) )
               where

import           Control.Monad.Trans
import           Data.String
import           Network.HTTP.Types
import           Network.HTTP.Types.Method
import           Network.Wai
import           Text.Blaze.Html.Renderer.Pretty
import           Web.Simple.Controller

import           Content

type SeagullController = Controller SeagullState

newtype SeagullState = SState { isAuthorized :: Bool }

seagull :: SeagullController ()
seagull = do
  let content = fromString . renderHtml . index
  let respondIndex status = respond . responseLBS status [(hContentType, "text/html")] . content
  routeTop $ do
    routeMethod GET $ respondIndex status200 showButton
    routeMethod POST $ respondIndex status401 (secret False)
