defmodule Laboratory.FeatureController do
  use Laboratory.Web, :controller

  def index(conn, _params) do
    render(conn, "index.html", features: features(conn))
  end

  def enable(conn, %{"id" => id}) do
    conn
    |> put_resp_cookie(id, "true")
    |> put_flash(:info, "Feature #{id} enabled.")
    |> redirect(to: feature_path(conn, :index))
  end

  def disable(conn, %{"id" => id}) do
    conn
    |> delete_resp_cookie(id)
    |> put_flash(:info, "Feature #{id} disabled.")
    |> redirect(to: feature_path(conn, :index))
  end

  defp features(conn) do
    features = Application.get_env(:laboratory, :features)
    Enum.map features, fn ({id, name, description}) ->
      %Feature{
        id: id,
        name: name,
        description: description,
        enabled: conn.cookies[to_string(id)] == "true"
      }
    end
  end
end
