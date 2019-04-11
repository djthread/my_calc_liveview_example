defmodule MyCalc.Repo do
  use Ecto.Repo,
    otp_app: :my_calc,
    adapter: Ecto.Adapters.Postgres
end
