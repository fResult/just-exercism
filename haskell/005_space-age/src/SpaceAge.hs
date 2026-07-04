module SpaceAge (Planet (..), ageOn) where

data Planet
  = Mercury
  | Venus
  | Earth
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds = secondsInEarthYear / orbitalMultiplier planet
  where
    secondsInEarthYear = seconds / secondsInMinute / minutesInHour / hoursInDay / earthCycle
    secondsInMinute    = 60
    minutesInHour      = 60
    hoursInDay         = 24
    earthCycle         = 365.25

    orbitalMultiplier Earth   = 1.0
    orbitalMultiplier Mercury = 0.2408467
    orbitalMultiplier Venus   = 0.61519726
    orbitalMultiplier Mars    = 1.8808158
    orbitalMultiplier Jupiter = 11.862615
    orbitalMultiplier Saturn  = 29.447498
    orbitalMultiplier Uranus  = 84.016856
    orbitalMultiplier Neptune = 164.79132
