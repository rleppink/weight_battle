defmodule WeightBattle.Repo do
  use Ecto.Repo,
    otp_app: :weight_battle,
    adapter: Ecto.Adapters.Postgres
end
