import Data.List

buildTower :: Int -> [String]
buildTower count = map floor [1..count] where
  spacing i = replicate (count - i) ' '
  tower i = replicate (2*i-1) '*'
  floor i = spacing i ++ tower i ++ spacing i