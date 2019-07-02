defmodule PlayertrackerApi.Repo do
  use Ecto.Repo,
    otp_app: :playertracker_api,
    adapter: Ecto.Adapters.Postgres
end
