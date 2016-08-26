defmodule Laboratory.Router do

  @doc """
  Mounts Laboratory UI at the specified path

  ## Examples

  require Laboratory.Router
  Laboratory.Router.mount_at "/feature_toggles", env: [:dev]

  ## Options

  * `env` - An array of mix environments in which the route should
  be enabled. Defaults to [:dev].
  """
  defmacro mount_at(path, options = [env: [:dev]]) do
    quote do
      scope unquote(path), Laboratory do
        if Mix.env in unquote(options[:env]) do
          forward "/", Router
        end
      end
    end
  end

  use Laboratory.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end


  scope "/", Laboratory do
    pipe_through :browser # Use the default browser stack

    get "/", FeatureController, :index
    post "/enable/:id", FeatureController, :enable
    post "/disable/:id", FeatureController, :disable
  end
end
