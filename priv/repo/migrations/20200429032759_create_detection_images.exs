defmodule ArWorldManager.Repo.Migrations.CreateDetectionImages do
  use Ecto.Migration

  def change do
    create table(:detection_images) do
      add :image_url, :string
      add :longitude, :float
      add :latitude, :float

      timestamps()
    end

  end
end
