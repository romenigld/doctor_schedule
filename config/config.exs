# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :doctor_schedule,
  ecto_repos: [DoctorSchedule.Repo]

# Configures the endpoint
config :doctor_schedule, DoctorScheduleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "G44Axw/qIqZegFgR28Zz5nLIKj5dhCIMC04S6+Iix3B+vr9kaTpmAR3eWEoDfwlR",
  render_errors: [view: DoctorScheduleWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DoctorSchedule.PubSub,
  live_view: [signing_salt: "ZK8qxkaZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :doctor_schedule, DoctorScheduleWeb.Auth.Guardian,
  issuer: "doctor_schedule",
  secret_key: System.get_env("GUARDIAN_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
