module ECharts.Legend where

import Data.Maybe
import Data.StrMap 
import Data.Argonaut.Core
import Data.Argonaut.Encode
import Data.Argonaut.Combinators

import ECharts.Color
import ECharts.Common
import ECharts.Coords
import ECharts.Style.Text
import ECharts.Formatter

data LegendItem = LegendString String |
  LegendItem {
    "name" :: Maybe String,
    "icon" :: Maybe String,
    "textStyle" :: Maybe TextStyle
    }

instance legendItemEncodeJson :: EncodeJson LegendItem where
  encodeJson (LegendString name) = fromString name
  encodeJson (LegendItem obj) =
    fromObject $ fromList $
    [
      "name" := obj.name,
      "icon" := obj.icon,
      "textStyle" := obj.textStyle
    ]

newtype Legend =
  Legend {
    "show" :: Maybe Boolean,
    "orient" :: Maybe Orient,
    "x" :: Maybe XPos,
    "y" :: Maybe YPos,
    "backgroundColor" :: Maybe Color,
    "borderColor" :: Maybe Color,
    "borderWidth" :: Maybe Number,
    "padding" :: Maybe (Corner Number),
    "itemGap" :: Maybe Number,
    "itemHeight" :: Maybe Number,
    "itemWidth" :: Maybe Number,
    "textStyle" :: Maybe TextStyle,
    "formatter" :: Maybe Formatter,
    "selectedMode" :: Maybe SelectedMode,
    "selected" :: Maybe (StrMap Boolean),
    "data" :: Maybe [LegendItem]
    }

emptyLegend = {
  show: Nothing,
  orient: Nothing,
  x: Nothing,
  y: Nothing,
  backgroundColor: Nothing,
  borderColor: Nothing,
  borderWidth: Nothing,
  padding: Nothing,
  itemGap: Nothing,
  itemHeight: Nothing,
  itemWidth: Nothing,
  textStyle: Nothing,
  formatter: Nothing,
  selectedMode: Nothing,
  selected: Nothing,
  data: Nothing
  }

instance legendEncodeJson :: EncodeJson Legend where
  encodeJson (Legend obj) =
    fromObject $ fromList $
    [
      "show" := obj.show,
      "orient" := obj.orient,
      "x" := obj.x,
      "y" := obj.y,
      "backgroundColor" := obj.backgroundColor,
      "borderColor" := obj.borderColor,
      "borderWidth" := obj.borderWidth,
      "padding" := obj.padding,
      "itemGap" := obj.itemGap,
      "itemHeight" := obj.itemHeight,
      "itemWidth" := obj.itemWidth,
      "textStyle" := obj.textStyle,
      "formatter" := obj.formatter,
      "selectedMode" := obj.selectedMode,
      "selected" := obj.selected,
      "data" := obj."data"
    ]
