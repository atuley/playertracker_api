# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :playertracker_api,
  ecto_repos: [PlayertrackerApi.Repo]

# Configures the endpoint
config :playertracker_api, PlayertrackerApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "R8k7EtbSSQ31Eg6zIIgl0j9Xs44k4zm/XMxOghyE4L5GyKPuyisuK4EnMVqWtACO",
  render_errors: [view: PlayertrackerApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: PlayertrackerApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
