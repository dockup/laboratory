# Laboratory

An elixir plug that allows developers to turn on/off feature switches using cookies
in their Plug-based web apps.

## Usage

First, add `:laboratory` to your app's mix.exs file.
Next, add the features that need to be toggled inside `config/config.exs`:

```
config :laboratory,
  features: [
    {:homepage_redesign, "Homepage Redesign", "This turns on the shiny new homepage design!"},
    {:feature_id_in_cookie, "Feature name", "Feature description"}
    etc ..
  ]
```

Now, mount `Laboratory.Router` at an endpoint in your router:

```elixir
# In phoenix app's web/router.ex

scope "/" do
  # Other routes

  forward "/lab", Laboratory.Router
end
```

If not using phoenix framework,

```elixir
# In your app's plug router

forward "/lab", to: Laboratory.Router
```

Now you can visit `http://localhost:4000/lab` to enable/disable the features you
want to test.

If you are the one who's developing the feature with id `:homepage_redesign`, you can use
the condition `if Laboratory.enabled?(conn, :homepage_redesign)` in your code for switching the
feature on/off.
