defmodule Laboratory do
  alias Laboratory.CookieStore

  def enabled?(id, opts \\ []) do
    get_store(opts).enabled?(id, opts)
  end

  def enable(id, opts \\ []) do
    get_store(opts).enable(id, opts)
  end

  def disable(id, opts \\ []) do
    get_store(opts).disable(id, opts)
  end

  def features(opts) do
    feature_list = Application.get_env(:laboratory, :features)
    store = get_store(opts)

    Enum.map feature_list, fn ({id, name, description}) ->
      %Feature{
        id: id,
        name: name,
        description: description,
        enabled: store.enabled?(id, opts)
      }
    end
  end

  def cookie_store?, do: get_store() == CookieStore

  defp get_store(opts \\ []) do
    default_store = Application.get_env(:laboratory, :store) || CookieStore
    Keyword.get(opts, :store, default_store)
  end
end
