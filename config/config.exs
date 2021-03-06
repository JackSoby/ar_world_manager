# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ar_world_manager,
  ecto_repos: [ArWorldManager.Repo]

# Configures the endpoint
config :ar_world_manager, ArWorldManagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "M4GRX2b5CdlJcWetYn+PWkwEpm6IMLPPPaB7OVn6MwQzEfyQP1ZbdWwqKFJc4/AV",
  render_errors: [view: ArWorldManagerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ArWorldManager.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"


config :ar_world_manager, ArWorldManager.Guardian,
       issuer: "ar_world_manager",
       secret_key: "j+D4DrTcKr0CA5R6F3IPMeqxyrga6U0ikGo+q9C3asgysmcyMs8H661IsTM2Fz5p"
