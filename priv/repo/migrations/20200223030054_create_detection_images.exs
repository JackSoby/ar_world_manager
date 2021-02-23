defmodule ArWorldManager.Repo.Migrations.CreateDetectionImages do
  use Ecto.Migration

  def change do
    create table(:detection_images) do
      add :image_url, :string

      timestamps()
    end

  end
end
