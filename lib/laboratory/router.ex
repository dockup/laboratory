defmodule Laboratory.Router do
  require EEx

  use Plug.Router

  plug Plug.Static, at: "/", from: :laboratory, only: ~w(css js)

  plug :match
  plug :dispatch

  get "/" do
    path = if conn.request_path == "/", do: "", else: conn.request_path
    send_resp(conn, 200, template(features(conn), path))
  end

  post "/disable/:id" do
    response = Laboratory.disable(id, conn: conn)
    if Laboratory.cookie_store? do
      redirect_back(response)
    else
      redirect_back(conn)
    end
  end

  post "/enable/:id" do
    response = Laboratory.enable(id, conn: conn)
    if Laboratory.cookie_store? do
      redirect_back(response)
    else
      redirect_back(conn)
    end
  end

  EEx.function_from_file :def, :template, "lib/laboratory/index.eex", [:features, :path]

  defp features(conn) do
    Laboratory.features(conn: conn)
  end

  defp redirect_back(conn) do
    [referer] = get_req_header(conn, "referer")
    conn
    |> put_resp_header("location", referer)
    |> send_resp(conn.status || 302, "You are being redirected")
  end
end
