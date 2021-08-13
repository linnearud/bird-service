defmodule Birdservice.Repo do
  use Ecto.Repo,
    otp_app: :birdservice,
    adapter: Ecto.Adapters.Postgres
end
