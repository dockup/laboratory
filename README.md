# Laboratory

[WIP] A phoenix plugin that allows developers to turn on/off feature switches using cookies.
(TODO: We can remove dependency on phoenix. This should work with any Plug based server.)

## Usage

First, add `:laboratory` to your phoenix app's mix.exs file.
Second, add the following to your `web/router.ex` file inside the router module:

    Laboratory.Router.mount_at "/lab"

Third, add features that need to be toggled to `config/dev.exs`:

```
config :laboratory,
  features: [
    {:homepage_redesign, "Homepage Redesign", "This turns on the shiny new homepage design!"}
  ]
```

Now you can use `if(Laboratory.enabled?(conn, :homepage_redesign))` in your code
for switching the feature on/off (TODO).
