defmodule GameOfLife.Patterns do
   def blinker, do: [
    [:dead,  :dead,  :dead  ],
    [:alive, :alive, :alive ],
    [:dead,  :dead,  :dead  ],
  ]

  def toad, do: [
    [:dead,  :dead,  :dead,  :dead ],
    [:dead,  :alive, :alive, :alive],
    [:alive, :alive, :alive, :dead ],
    [:dead,  :dead,  :dead,  :dead ],
  ]

  def glider, do: [
    [:dead,  :alive,  :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead ],
    [:dead,  :dead,  :alive, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead ],
    [:alive, :alive, :alive, :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead ],
    [:dead,  :dead,  :dead,  :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead ],
    [:dead,  :dead,  :dead,  :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead ],
    [:dead,  :dead,  :dead,  :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead ],
    [:dead,  :dead,  :dead,  :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead ],
    [:dead,  :dead,  :dead,  :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead ],
    [:dead,  :dead,  :dead,  :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead ],
    [:dead,  :dead,  :dead,  :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead ],
    [:dead,  :dead,  :dead,  :dead, :dead, :dead, :dead, :dead, :dead, :dead, :dead ],
  ]

  def gosper_glider_gun, do: [
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :alive, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :alive, :dead,  :alive, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :alive, :alive, :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :alive, :alive, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :alive, :alive, :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :alive, :dead,  :dead,  :dead,  :alive, :dead,  :dead,  :dead, :dead,  :alive, :alive, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :alive, :alive, :dead,  :dead,  :dead],
    [:dead,  :alive, :alive, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :alive, :dead,  :dead,  :dead,  :dead,  :dead,  :alive, :dead,  :dead, :dead,  :alive, :alive, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :alive, :alive, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :alive, :dead,  :dead,  :dead,  :alive, :dead,  :alive, :alive, :dead, :dead,  :dead,  :dead,  :alive, :dead,  :alive, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :alive, :dead,  :dead,  :dead,  :dead,  :dead,  :alive, :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :alive, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :alive, :dead,  :dead,  :dead,  :alive, :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :alive, :alive, :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
    [:dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead, :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead,  :dead],
  ]

end
