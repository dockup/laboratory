# Laboratory

An elixir plug that allows developers to turn on/off feature switches in their
Plug-based web apps.

## Usage

Add laboratory to your mix dependencies.

```elixir
def deps do
  [{:laboratory, "~> 0.0.1"}]
end
```

Next, add the features that need to be toggled inside `config/dev.exs`:

```
config :laboratory,
  features: [
    {:homepage_redesign, "Homepage Redesign", "This turns on the shiny new homepage design!"},
    etc ..
  ]
```

Now, mount `Laboratory.Router` at an endpoint in your router:

```elixir
# In phoenix app's web/router.ex

scope "/lab", Laboratory do
  forward "/", Router
end
```

If not using phoenix framework,

```elixir
# In your app's plug router

forward "/lab", to: Laboratory.Router
```

Now you can visit `http://localhost:4000/lab` to enable/disable the features you
want to test.

If you are the one who's developing the feature with id `:homepage_redesign`,
you can use the condition `if Laboratory.enabled?(conn, :homepage_redesign)`
in your code for switching the feature on/off.

## Custom backends

By default, Laboratory uses a DETS table to store the feature flags. You can
use a custom backend, such as a database for the feature flags, by writing your
own module and setting it in config. An example would be if you need to store
the flags in the database rather than DETS.

```elixir
config :laboratory,
  store: MyApp.CustomLaboratoryStore,
  features: [
    # ...
  ]
```

To do this, the module needs to implement the following functions:
`enabled?/2`, `enable/2` and `disable/2`. Please refer to
`Laboratory.DetsStore`, which is the default backend, for an example of how to
implement a storage backend for `Laboratory`.
