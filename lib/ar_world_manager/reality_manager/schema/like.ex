defmodule ArWorldManager.RealityManager.Schema.Like do
  use Ecto.Schema
  import Ecto.Changeset
  alias ArWorldManager.Accounts.User
  alias ArWorldManager.RealityManager.Schema.DetectionImage

  schema "likes" do
    belongs_to(:user, User)
    belongs_to(:detection_image, DetectionImage)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:user_id, :reality_marker_id])
  end
end
