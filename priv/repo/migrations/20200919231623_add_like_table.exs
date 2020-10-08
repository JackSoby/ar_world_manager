defmodule ArWorldManager.Repo.Migrations.AddLikeTable do
  use Ecto.Migration

  def change do
    create table(:likes) do
      add(:reality_marker_id, references(:reality_markers))
      add(:user_id, references(:users))

      timestamps()
    end
  end
end
