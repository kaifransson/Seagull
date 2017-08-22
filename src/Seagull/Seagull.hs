{-# LANGUAGE OverloadedStrings #-}

module Seagull ( seagull
               , SeagullState )
               where

import           Data.String
import           Network.HTTP.Types
import           Network.HTTP.Types.Method
import           Network.Wai
import           Network.Wai.Middleware.HttpAuth
import           Text.Blaze.Html.Renderer.Pretty
import           Web.Simple.Controller

import           Content

type SeagullController = Controller SeagullState

type SeagullState = ()

authMiddleware :: Middleware
authMiddleware = let checkCreds u p = return $ u == "test" && p == "pw"
                     authSettings = "The sea" { authIsProtected = isProtected }
                  in basicAuth checkCreds authSettings

isProtected :: Request -> IO Bool
isProtected = return . (=="POST") . requestMethod

seagull :: SeagullState -> Application
seagull initalState = authMiddleware $ controllerApp initalState $ do
  let content = fromString . renderHtml . index
  let respondIndex = respond . responseLBS status200 [(hContentType, "text/html")] . content
  routeTop $ do
    routeMethod GET $ respondIndex showButton
    routeMethod POST $ respondIndex secret
