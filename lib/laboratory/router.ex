defmodule Laboratory.Router do
  require EEx

  use Plug.Router

  plug Plug.Static, at: "/", from: :laboratory, only: ~w(css js)

  plug :match
  plug :dispatch

  get "/" do
    path = if conn.request_path == "/", do: "", else: conn.request_path
    send_resp(conn, 200, template(Laboratory.features, path))
  end

  post "/disable/:id" do
    Laboratory.disable(id)
    redirect_back(conn)
  end

  post "/enable/:id" do
    Laboratory.enable(id)
    redirect_back(conn)
  end

  EEx.function_from_file :def, :template, "lib/laboratory/index.eex", [:features, :path]

  defp redirect_back(conn) do
    [referer] = get_req_header(conn, "referer")
    conn
    |> put_resp_header("location", referer)
    |> send_resp(conn.status || 302, "You are being redirected")
  end
end
