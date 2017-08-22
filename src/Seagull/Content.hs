{-# LANGUAGE OverloadedStrings #-}

module Content ( index
               , showButton
               , secret
               , View
                ) where

import           Text.Blaze.Html5            as H
import           Text.Blaze.Html5.Attributes as A

type View = H.Html

index :: View -> H.Html
index view = H.docTypeHtml $ do
  H.head $
    H.title "Seagull"
  H.body $ do
    h1 "Seagull"
    nav $
        a ! href "/" $ "[Home]"
    h3 "aka MåS aka MaaS aka Meds as a Service"
    H.div ! A.id "main-content" $
        view
    footer $
        H.span "this is webscale"

showButton :: View
showButton =
    H.form ! method "POST" $
      H.button "Show"

secret :: View
secret =
    p "it's a secret to everybody"
