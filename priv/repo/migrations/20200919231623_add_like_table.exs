defmodule ArWorldManager.Repo.Migrations.AddLikeTable do
  use Ecto.Migration

  def change do
    create table(:likes) do
      add(:detection_image_id, references(:detection_images))
      add(:user_id, references(:users))

      timestamps()
    end
  end
end
