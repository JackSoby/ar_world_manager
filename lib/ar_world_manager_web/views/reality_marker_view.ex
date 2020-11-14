defmodule ArWorldManagerWeb.RealityMarkerView do
  use ArWorldManagerWeb, :view
  require IEx
  alias ArWorldManagerWeb.RealityMarkerView


  def render("index.json", %{reality_markers: reality_markers}) do
    %{reality_markers: render_many(reality_markers, RealityMarkerView, "reality_marker.json")}
  end


  def render("reality_marker.json", %{reality_marker: reality_marker}) do
    %{
      id: reality_marker.id,
      content: reality_marker.content,
      position: return_srp(reality_marker.position),
      scale: reality_marker.scale,
      latitude: reality_marker.latitude,
      longitude: reality_marker.longitude,
      horizontalAccuracy: reality_marker.horizontal_accuracy,
      verticalAccuracy: reality_marker.vertical_accuracy,
      altitude: reality_marker.altitude,
      eulerAngles: return_srp(reality_marker.euler_angles),
      type: reality_marker.type,
      contentUrl: reality_marker.content_url
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
