defmodule ApiProject.Repo do
  use Ecto.Repo,
    otp_app: :api_project,
    adapter: Ecto.Adapters.Postgres
end
