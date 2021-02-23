defmodule ArWorldManager.Repo.Migrations.AddCommentTable do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add(:detection_image_id, references(:detection_images))
      add(:user_id, references(:users))
      add :content, :string

      timestamps()
    end
  end
end
