# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :my_calc,
  ecto_repos: [MyCalc.Repo]

# Configures the endpoint
config :my_calc, MyCalcWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bwVG7X5huKN8aM5DJAm+T8HsI/WY7+ZgH1nQEST9/1aNVzIGnilOKgwcUdjGdeqX",
  render_errors: [view: MyCalcWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyCalc.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "2/dsFwu2FTZ9SXkXc9yosjKtMZ1qNup4"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
