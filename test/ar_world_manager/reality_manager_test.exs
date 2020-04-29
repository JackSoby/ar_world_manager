defmodule ArWorldManager.RealityManagerTest do
  use ArWorldManager.DataCase

  alias ArWorldManager.RealityManager

  describe "detection_images" do
    alias ArWorldManager.RealityManager.DetectionImage

    @valid_attrs %{image_url: "some image_url", latitude: 120.5, longitude: 120.5, type: "some type"}
    @update_attrs %{image_url: "some updated image_url", latitude: 456.7, longitude: 456.7, type: "some updated type"}
    @invalid_attrs %{image_url: nil, latitude: nil, longitude: nil, type: nil}

    def detection_image_fixture(attrs \\ %{}) do
      {:ok, detection_image} =
        attrs
        |> Enum.into(@valid_attrs)
        |> RealityManager.create_detection_image()

      detection_image
    end

    test "list_detection_images/0 returns all detection_images" do
      detection_image = detection_image_fixture()
      assert RealityManager.list_detection_images() == [detection_image]
    end

    test "get_detection_image!/1 returns the detection_image with given id" do
      detection_image = detection_image_fixture()
      assert RealityManager.get_detection_image!(detection_image.id) == detection_image
    end

    test "create_detection_image/1 with valid data creates a detection_image" do
      assert {:ok, %DetectionImage{} = detection_image} = RealityManager.create_detection_image(@valid_attrs)
      assert detection_image.image_url == "some image_url"
      assert detection_image.latitude == 120.5
      assert detection_image.longitude == 120.5
      assert detection_image.type == "some type"
    end

    test "create_detection_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RealityManager.create_detection_image(@invalid_attrs)
    end

    test "update_detection_image/2 with valid data updates the detection_image" do
      detection_image = detection_image_fixture()
      assert {:ok, %DetectionImage{} = detection_image} = RealityManager.update_detection_image(detection_image, @update_attrs)
      assert detection_image.image_url == "some updated image_url"
      assert detection_image.latitude == 456.7
      assert detection_image.longitude == 456.7
      assert detection_image.type == "some updated type"
    end

    test "update_detection_image/2 with invalid data returns error changeset" do
      detection_image = detection_image_fixture()
      assert {:error, %Ecto.Changeset{}} = RealityManager.update_detection_image(detection_image, @invalid_attrs)
      assert detection_image == RealityManager.get_detection_image!(detection_image.id)
    end

    test "delete_detection_image/1 deletes the detection_image" do
      detection_image = detection_image_fixture()
      assert {:ok, %DetectionImage{}} = RealityManager.delete_detection_image(detection_image)
      assert_raise Ecto.NoResultsError, fn -> RealityManager.get_detection_image!(detection_image.id) end
    end

    test "change_detection_image/1 returns a detection_image changeset" do
      detection_image = detection_image_fixture()
      assert %Ecto.Changeset{} = RealityManager.change_detection_image(detection_image)
    end
  end

  describe "reality_markers" do
    alias ArWorldManager.RealityManager.Schema.RealityMarker

    @valid_attrs %{content: "some content", image_url: "some image_url", latitude: 120.5, longitude: 120.5, type: "some type"}
    @update_attrs %{content: "some updated content", image_url: "some updated image_url", latitude: 456.7, longitude: 456.7, type: "some updated type"}
    @invalid_attrs %{content: nil, image_url: nil, latitude: nil, longitude: nil, type: nil}

    def reality_marker_fixture(attrs \\ %{}) do
      {:ok, reality_marker} =
        attrs
        |> Enum.into(@valid_attrs)
        |> RealityManager.create_reality_marker()

      reality_marker
    end

    test "list_reality_markers/0 returns all reality_markers" do
      reality_marker = reality_marker_fixture()
      assert RealityManager.list_reality_markers() == [reality_marker]
    end

    test "get_reality_marker!/1 returns the reality_marker with given id" do
      reality_marker = reality_marker_fixture()
      assert RealityManager.get_reality_marker!(reality_marker.id) == reality_marker
    end

    test "create_reality_marker/1 with valid data creates a reality_marker" do
      assert {:ok, %RealityMarker{} = reality_marker} = RealityManager.create_reality_marker(@valid_attrs)
      assert reality_marker.content == "some content"
      assert reality_marker.image_url == "some image_url"
      assert reality_marker.latitude == 120.5
      assert reality_marker.longitude == 120.5
      assert reality_marker.type == "some type"
    end

    test "create_reality_marker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RealityManager.create_reality_marker(@invalid_attrs)
    end

    test "update_reality_marker/2 with valid data updates the reality_marker" do
      reality_marker = reality_marker_fixture()
      assert {:ok, %RealityMarker{} = reality_marker} = RealityManager.update_reality_marker(reality_marker, @update_attrs)
      assert reality_marker.content == "some updated content"
      assert reality_marker.image_url == "some updated image_url"
      assert reality_marker.latitude == 456.7
      assert reality_marker.longitude == 456.7
      assert reality_marker.type == "some updated type"
    end

    test "update_reality_marker/2 with invalid data returns error changeset" do
      reality_marker = reality_marker_fixture()
      assert {:error, %Ecto.Changeset{}} = RealityManager.update_reality_marker(reality_marker, @invalid_attrs)
      assert reality_marker == RealityManager.get_reality_marker!(reality_marker.id)
    end

    test "delete_reality_marker/1 deletes the reality_marker" do
      reality_marker = reality_marker_fixture()
      assert {:ok, %RealityMarker{}} = RealityManager.delete_reality_marker(reality_marker)
      assert_raise Ecto.NoResultsError, fn -> RealityManager.get_reality_marker!(reality_marker.id) end
    end

    test "change_reality_marker/1 returns a reality_marker changeset" do
      reality_marker = reality_marker_fixture()
      assert %Ecto.Changeset{} = RealityManager.change_reality_marker(reality_marker)
    end
  end
end
