defmodule Laboratory.PageController do
  use Laboratory.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
