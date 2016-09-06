defmodule Laboratory.CookieStore do
  @moduledoc """
  Provides a cookie based backend to store enabled features.
  """

  @doc """
  Checks if the given feature id is enabled.

  To use this, the conn object needs to be passed in through the opts.

    > Laboratory.CookieStore.enabled?(:foo, conn: conn)
    false

  """
  def enabled?(id, opts \\ []) do
    conn = get_conn(opts) |> Plug.Conn.fetch_cookies
    conn.cookies[to_string(id)] == "true"
  end

  @doc """
  Enables the feature with the id.

  Returns a conn object with the cookie set.
  """
  def enable(id, opts \\ []) do
    get_conn(opts)
    |> Plug.Conn.put_resp_cookie(id, "true")
  end

  @doc """
  Disable the feature with the id.

  Returns a conn object with the corresponding cookie deleted.
  """
  def disable(id, opts \\ []) do
    get_conn(opts)
    |> Plug.Conn.delete_resp_cookie(id)
  end

  defp get_conn(opts), do: Keyword.get(opts, :conn)
end
