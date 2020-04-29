defmodule ArWorldManager.Repo.Migrations.CreateRealityMarkers do
  use Ecto.Migration

  def change do
    create table(:reality_markers) do
      add :type, :string
      add :content, :string
      add(:position, :map, default: "{}")
      add(:euler_angles, :map, default: "{}")
      add(:scale, :map, default: "{}")
      add(:detection_image_id, references(:detection_images))


      timestamps()
    end

  end
end
