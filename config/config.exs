import Config

config :coherence, Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: ""

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
