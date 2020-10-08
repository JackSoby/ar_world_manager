defmodule ArWorldManager.RealityManager.Schema.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias ArWorldManager.RealityManager.Schema.RealityMarker
  alias ArWorldManager.Accounts.User

  schema "comments" do
    belongs_to(:user, User)
    belongs_to(:reality_marker, RealityMarker)
    field :content, :string

    timestamps()
  end

  @doc false
  def changeset(detection_image, attrs) do
    detection_image
    |> cast(attrs, [:user_id, :reality_marker_id, :content])
  end
end
