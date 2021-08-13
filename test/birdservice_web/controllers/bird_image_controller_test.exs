defmodule BirdserviceWeb.BirdImageControllerTest do
  use BirdserviceWeb.ConnCase

  alias Birdservice.Assets
  alias Birdservice.Assets.BirdImage

  @create_attrs %{
    path: "some path"
  }
  @update_attrs %{
    path: "some updated path"
  }
  @invalid_attrs %{path: nil}

  def fixture(:bird_image) do
    {:ok, bird_image} = Assets.create_bird_image(@create_attrs)
    bird_image
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all bird_images", %{conn: conn} do
      conn = get(conn, Routes.bird_image_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create bird_image" do
    test "renders bird_image when data is valid", %{conn: conn} do
      conn = post(conn, Routes.bird_image_path(conn, :create), bird_image: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.bird_image_path(conn, :show, id))

      assert %{
               "id" => id,
               "path" => "some path"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.bird_image_path(conn, :create), bird_image: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update bird_image" do
    setup [:create_bird_image]

    test "renders bird_image when data is valid", %{conn: conn, bird_image: %BirdImage{id: id} = bird_image} do
      conn = put(conn, Routes.bird_image_path(conn, :update, bird_image), bird_image: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.bird_image_path(conn, :show, id))

      assert %{
               "id" => id,
               "path" => "some updated path"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, bird_image: bird_image} do
      conn = put(conn, Routes.bird_image_path(conn, :update, bird_image), bird_image: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete bird_image" do
    setup [:create_bird_image]

    test "deletes chosen bird_image", %{conn: conn, bird_image: bird_image} do
      conn = delete(conn, Routes.bird_image_path(conn, :delete, bird_image))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.bird_image_path(conn, :show, bird_image))
      end
    end
  end

  defp create_bird_image(_) do
    bird_image = fixture(:bird_image)
    %{bird_image: bird_image}
  end
end
