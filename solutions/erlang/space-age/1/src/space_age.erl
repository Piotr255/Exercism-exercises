-module(space_age).

-export([age/2, planet_map/1]).

planet_map(Planet) ->
  PlanetsMap =
    #{mercury => 0.2408467,
      venus => 0.61519726,
      earth => 1.0,
      mars => 1.8808158,
      jupiter => 11.862615,
      saturn => 29.447498,
      uranus => 84.016846,
      neptune => 164.79132},
  #{Planet := Val} = PlanetsMap,
  Val.

age(Planet, Seconds) ->
  Multiplier = planet_map(Planet),
  Seconds / 31_557_600 / Multiplier.
