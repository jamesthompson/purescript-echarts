module ECharts.Grid where

import Data.Maybe
import Data.StrMap (fromList)
import Data.Argonaut.Core
import Data.Argonaut.Encode
import Data.Argonaut.Combinators

import ECharts.Common
import ECharts.Color

newtype Grid =
  Grid {
    "x" :: Maybe PercentOrPixel,
    "x2" :: Maybe PercentOrPixel,
    "y" :: Maybe PercentOrPixel,
    "y2" :: Maybe PercentOrPixel,
    "width" :: Maybe PercentOrPixel,
    "height" :: Maybe PercentOrPixel,
    "backgroundColor" :: Maybe Color,
    "borderWidth" :: Maybe Number,
    "borderColor" :: Maybe Number
    }

instance gridEncodeJson :: EncodeJson Grid where
  encodeJson (Grid obj) =
    fromObject $ fromList $
    [
      "x" := obj.x,
      "y" := obj.y,
      "x2" := obj.x2,
      "y2" := obj.y2,
      "width" := obj.width,
      "height" := obj.height,
      "backgroundColor" := obj.backgroundColor,
      "borderWidth" := obj.borderWidth,
      "borderColor" := obj.borderColor
    ]

gridDefault = {
  x: Nothing,
  y: Nothing,
  x2: Nothing,
  y2: Nothing,
  width: Nothing,
  height: Nothing,
  backgroundColor: Nothing,
  borderWidth: Nothing,
  borderColor: Nothing
  }
