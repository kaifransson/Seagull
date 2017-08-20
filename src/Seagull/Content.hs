{-# LANGUAGE OverloadedStrings #-}

module Content ( index
                ) where

import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A

index :: H.Html
index = H.docTypeHtml $ do
  H.head $ do
    H.title "Seagull"
  H.body $ do
    H.h1 "Seagull"
    H.h3 "aka MåS aka MaaS aka Meds as a Service"
    H.form H.! A.method "POST" $ do
      H.button "Show"
    H.footer $ do
        H.span "this is webscale"
