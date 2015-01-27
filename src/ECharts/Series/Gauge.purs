module ECharts.Series.Gauge where

import Control.Monad.Eff
import Data.Function
import Data.Maybe
import Data.Argonaut.Core
import Data.Argonaut.Encode
import Data.Argonaut.Combinators
import Data.Tuple
import Data.StrMap

import ECharts.Common
import ECharts.Coords
import ECharts.Color
import ECharts.Style.Line
import ECharts.Style.Text
import ECharts.Symbol
import ECharts.Formatter


  
newtype Pointer =
  Pointer {
    "length" :: Maybe Number,
    "width" :: Maybe Number,
    "color" :: Maybe Color
    }

pointerDefault = {
  length: Nothing,
  width: Nothing,
  color: Nothing
  }

instance pointerEncodeJson :: EncodeJson Pointer where
  encodeJson (Pointer p) = fromObject $ fromList $ [
    "length" := p.length,
    "width" := p.width,
    "color" := p.color
    ]

newtype SplitLine =
  SplitLine {
    "show" :: Maybe Boolean,
    "length" :: Maybe Number,
    "lineStyle" :: Maybe LineStyle
    }

splitLineDefault = {
  show: Nothing,
  length: Nothing,
  lineStyle: Nothing
  }

instance splitLineEncodeJson :: EncodeJson SplitLine where
  encodeJson (SplitLine sl) = fromObject $ fromList $ [
    "show" := sl.show,
    "length" := sl.length,
    "lineStyle" := sl.lineStyle
    ]


newtype GaugeDetail =
  GaugeDetail {
    "show" :: Maybe Boolean,
    "backgroundColor" :: Maybe Color,
    "borderWidth" :: Maybe Number,
    "borderColor" :: Maybe Color,
    "width" :: Maybe Number,
    "height" :: Maybe Number,
    "offsetCenter" :: Maybe (Tuple PercentOrPixel PercentOrPixel),
    "formatter" :: Maybe Formatter,
    "textStyle" :: Maybe TextStyle
    }

gaugeDetailDefault = {
  show: Nothing,
  backgroundColor: Nothing,
  borderWidth: Nothing,
  borderColor: Nothing,
  width: Nothing,
  height: Nothing,
  offsetCenter: Nothing,
  formatter: Nothing,
  textStyle: Nothing
  }


instance gaugeDetailEncodeJson :: EncodeJson GaugeDetail where
  encodeJson (GaugeDetail gd) = fromObject $ fromList $ [
    "show" := gd.show,
    "backgroundColor" := gd.backgroundColor,
    "borderWidth" := gd.borderWidth,
    "borderColor" := gd.borderColor,
    "width" := gd.width,
    "height" := gd.height,
    "offsetCenter" := gd.offsetCenter,
    "formatter" := gd.formatter,
    "textStyle" := gd.textStyle
    ]
