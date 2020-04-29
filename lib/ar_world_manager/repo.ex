defmodule ArWorldManager.Repo do
  use Ecto.Repo,
    otp_app: :ar_world_manager,
    adapter: Ecto.Adapters.Postgres
end
