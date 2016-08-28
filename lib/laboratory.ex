defmodule Laboratory do
  def enabled?(conn, id) do
    conn = Plug.Conn.fetch_cookies(conn)
    conn.cookies[to_string(id)] == "true"
  end
end
