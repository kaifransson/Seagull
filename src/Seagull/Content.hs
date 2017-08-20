{-# LANGUAGE OverloadedStrings #-}

module Content ( index
               , showButton
               , View
                ) where

import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A

type View = H.Html

index :: View -> H.Html
index view = H.docTypeHtml $ do
  H.head $
    H.title "Seagull"
  H.body $ do
    H.h1 "Seagull"
    H.h3 "aka MåS aka MaaS aka Meds as a Service"
    H.div H.! A.id "main-content" $
        view
    H.footer $
        H.span "this is webscale"

showButton :: View
showButton =
    H.form H.! A.method "POST" $
      H.button "Show"
