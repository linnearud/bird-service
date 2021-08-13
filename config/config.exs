# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :birdservice,
  ecto_repos: [Birdservice.Repo]

# Configures the endpoint
config :birdservice, BirdserviceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ja+6qmWLpkAEiv4LkH69nT5dqJ0Wvw7PhASu8NoQJx9NJ/hJFGbzALEA2Z8UiW0o",
  render_errors: [view: BirdserviceWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Birdservice.PubSub,
  live_view: [signing_salt: "7XqJhULK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
