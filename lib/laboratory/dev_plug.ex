# Used for developing the plug
defmodule Laboratory.DevPlug do
  use Plug.Router

  plug :match
  plug :dispatch

  forward "/", to: Laboratory.Router
end
