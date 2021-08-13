defmodule BirdserviceWeb.GenusControllerTest do
  use BirdserviceWeb.ConnCase

  alias Birdservice.Birds
  alias Birdservice.Birds.Genus

  @create_attrs %{
    name_latin: "some name_latin",
    name_sv: "some name_sv",
    slug: "some slug"
  }
  @update_attrs %{
    name_latin: "some updated name_latin",
    name_sv: "some updated name_sv",
    slug: "some updated slug"
  }
  @invalid_attrs %{name_latin: nil, name_sv: nil, slug: nil}

  def fixture(:genus) do
    {:ok, genus} = Birds.create_genus(@create_attrs)
    genus
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all genera", %{conn: conn} do
      conn = get(conn, Routes.genus_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create genus" do
    test "renders genus when data is valid", %{conn: conn} do
      conn = post(conn, Routes.genus_path(conn, :create), genus: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.genus_path(conn, :show, id))

      assert %{
               "id" => id,
               "name_latin" => "some name_latin",
               "name_sv" => "some name_sv",
               "slug" => "some slug"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.genus_path(conn, :create), genus: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update genus" do
    setup [:create_genus]

    test "renders genus when data is valid", %{conn: conn, genus: %Genus{id: id} = genus} do
      conn = put(conn, Routes.genus_path(conn, :update, genus), genus: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.genus_path(conn, :show, id))

      assert %{
               "id" => id,
               "name_latin" => "some updated name_latin",
               "name_sv" => "some updated name_sv",
               "slug" => "some updated slug"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, genus: genus} do
      conn = put(conn, Routes.genus_path(conn, :update, genus), genus: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete genus" do
    setup [:create_genus]

    test "deletes chosen genus", %{conn: conn, genus: genus} do
      conn = delete(conn, Routes.genus_path(conn, :delete, genus))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.genus_path(conn, :show, genus))
      end
    end
  end

  defp create_genus(_) do
    genus = fixture(:genus)
    %{genus: genus}
  end
end
