defmodule Birdservice.AssetsTest do
  use Birdservice.DataCase

  alias Birdservice.Assets

  describe "images" do
    alias Birdservice.Assets.Image

    @valid_attrs %{path: "some path"}
    @update_attrs %{path: "some updated path"}
    @invalid_attrs %{path: nil}

    def image_fixture(attrs \\ %{}) do
      {:ok, image} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assets.create_image()

      image
    end

    test "list_images/0 returns all images" do
      image = image_fixture()
      assert Assets.list_images() == [image]
    end

    test "get_image!/1 returns the image with given id" do
      image = image_fixture()
      assert Assets.get_image!(image.id) == image
    end

    test "create_image/1 with valid data creates a image" do
      assert {:ok, %Image{} = image} = Assets.create_image(@valid_attrs)
      assert image.path == "some path"
    end

    test "create_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assets.create_image(@invalid_attrs)
    end

    test "update_image/2 with valid data updates the image" do
      image = image_fixture()
      assert {:ok, %Image{} = image} = Assets.update_image(image, @update_attrs)
      assert image.path == "some updated path"
    end

    test "update_image/2 with invalid data returns error changeset" do
      image = image_fixture()
      assert {:error, %Ecto.Changeset{}} = Assets.update_image(image, @invalid_attrs)
      assert image == Assets.get_image!(image.id)
    end

    test "delete_image/1 deletes the image" do
      image = image_fixture()
      assert {:ok, %Image{}} = Assets.delete_image(image)
      assert_raise Ecto.NoResultsError, fn -> Assets.get_image!(image.id) end
    end

    test "change_image/1 returns a image changeset" do
      image = image_fixture()
      assert %Ecto.Changeset{} = Assets.change_image(image)
    end
  end

  describe "bird_images" do
    alias Birdservice.Assets.BirdImage

    @valid_attrs %{path: "some path"}
    @update_attrs %{path: "some updated path"}
    @invalid_attrs %{path: nil}

    def bird_image_fixture(attrs \\ %{}) do
      {:ok, bird_image} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assets.create_bird_image()

      bird_image
    end

    test "list_bird_images/0 returns all bird_images" do
      bird_image = bird_image_fixture()
      assert Assets.list_bird_images() == [bird_image]
    end

    test "get_bird_image!/1 returns the bird_image with given id" do
      bird_image = bird_image_fixture()
      assert Assets.get_bird_image!(bird_image.id) == bird_image
    end

    test "create_bird_image/1 with valid data creates a bird_image" do
      assert {:ok, %BirdImage{} = bird_image} = Assets.create_bird_image(@valid_attrs)
      assert bird_image.path == "some path"
    end

    test "create_bird_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assets.create_bird_image(@invalid_attrs)
    end

    test "update_bird_image/2 with valid data updates the bird_image" do
      bird_image = bird_image_fixture()
      assert {:ok, %BirdImage{} = bird_image} = Assets.update_bird_image(bird_image, @update_attrs)
      assert bird_image.path == "some updated path"
    end

    test "update_bird_image/2 with invalid data returns error changeset" do
      bird_image = bird_image_fixture()
      assert {:error, %Ecto.Changeset{}} = Assets.update_bird_image(bird_image, @invalid_attrs)
      assert bird_image == Assets.get_bird_image!(bird_image.id)
    end

    test "delete_bird_image/1 deletes the bird_image" do
      bird_image = bird_image_fixture()
      assert {:ok, %BirdImage{}} = Assets.delete_bird_image(bird_image)
      assert_raise Ecto.NoResultsError, fn -> Assets.get_bird_image!(bird_image.id) end
    end

    test "change_bird_image/1 returns a bird_image changeset" do
      bird_image = bird_image_fixture()
      assert %Ecto.Changeset{} = Assets.change_bird_image(bird_image)
    end
  end
end
