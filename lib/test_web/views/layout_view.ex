defmodule TestWeb.LayoutView do
  use TestWeb, :view
  import Pow.Plug, only: [current_user: 1]
end
