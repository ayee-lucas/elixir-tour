defmodule ElixirTour.Repo do
  use Ecto.Repo,
    otp_app: :elixir_tour,
    adapter: Ecto.Adapters.Postgres
end
