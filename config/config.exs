# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :test,
  ecto_repos: [Test.Repo]

# Configures the endpoint
config :test, TestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zUus1gCmZ+5F4cvhPbZO4LJzVT9CFo1Eo6VWUfxvyNWbyc8sI3cXmgi6LpRrQNvI",
  render_errors: [view: TestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Test.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :test, :pow,
  user: Test.Users.User,
  repo: Test.Repo
config :test, Test.Guardian,
       issuer: "test",
       secret_key: "P6M0+p/+GYsDxY5sBlK9lgcXkbYIByXTj8SEiC7fhjZRpnvrDZrQqnVE4c2SnwSV"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"