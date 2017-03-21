# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :omega, ecto_repos: [Omega.Repo]
config :omega, Omega.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "omega_repo",
  username: "omega",
  password: "supersecret",
  hostname: "localhost"


config :omega, omega_api_key: "abc123key"
config :logger, compile_time_purge_level: :info


# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
