defmodule ArWorldManager.Repo.Migrations.AddCords do
  use Ecto.Migration

  def change do
    alter table(:reality_markers) do
      add :longitude, :float
      add :latitude, :float
    end
  end
end
