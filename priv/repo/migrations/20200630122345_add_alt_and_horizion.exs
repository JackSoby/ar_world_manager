defmodule ArWorldManager.Repo.Migrations.AddAltAndHorizion do
  use Ecto.Migration

  def change do
    alter table(:reality_markers) do
      add :horizontal_accuracy, :float
      add :vertical_accuracy, :float
      add :altitude, :float

    end
  end
end
