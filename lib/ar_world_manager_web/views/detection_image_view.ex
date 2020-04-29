defmodule ArWorldManagerWeb.DetectionImageView do
  use ArWorldManagerWeb, :view
  require IEx

  def render("index.json", %{detection_images: detection_images}) do
    %{data: render_many(detection_images, __MODULE__, "detection_image.json")}
  end

  def render("detection_image.json", %{detection_image: detection_image}) do
    %{
      id: detection_image.id,
      image_url: detection_image.image_url,
      arItems:
        render_many(
          detection_image.reality_markers,
          __MODULE__,
          "ar_item.json",
          as: :reality_marker
        )
    }
  end

  def render("ar_item.json", %{reality_marker: reality_marker}) do
    %{
      id: reality_marker.id,
      content: reality_marker.content,
      position: return_srp(reality_marker.position),
      scale: reality_marker.scale,
      euler_angles: return_srp(reality_marker.euler_angles),
      type: reality_marker.type
    }
  end

  defp return_srp(srp) do
    posx = if srp.x == nil, do: 0, else: srp.x
    posy = if srp.y == nil, do: 0, else: srp.y
    posz = if srp.z == nil, do: 0, else: srp.z

    %{
      x: posx,
      y: posy,
      z: posz
    }
  end
end
