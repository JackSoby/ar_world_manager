defmodule ArWorldManager.Repo.Migrations.AddCommentTable do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add(:reality_marker_id, references(:reality_markers))
      add(:user_id, references(:users))
      add :content, :string

      timestamps()
    end
  end
end
