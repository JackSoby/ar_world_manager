defmodule ArWorldManager.Repo.Migrations.AddContentUrl do
  use Ecto.Migration

  def change do
    alter table(:reality_markers) do
      add :content_url, :string

    end
  end
end
