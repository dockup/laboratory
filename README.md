# Laboratory

[WIP] A phoenix plugin that allows developers to turn on/off feature switches using cookies.
(TODO: We can remove dependency on phoenix. This should work with any Plug based server.)

## Usage

First, add `:laboratory` to your phoenix app's mix.exs file.
Next, add the features that need to be toggled inside `config/dev.exs`:

```
config :laboratory,
  features: [
    {:homepage_redesign, "Homepage Redesign", "This turns on the shiny new homepage design!"},
    etc ..
  ]
```

Now, add the following to your `web/router.ex` file inside the router module:

    Laboratory.Router.mount_at "/lab"

Now you can visit `http://localhost:4000/lab` to enable/disable the features you
want to test.

If you are the one who's developing the feature, you can use
`if(Laboratory.enabled?(conn, :homepage_redesign))` in your code for switching the
feature on/off (TODO).
