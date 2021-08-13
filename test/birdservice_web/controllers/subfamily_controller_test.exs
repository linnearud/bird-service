defmodule BirdserviceWeb.SubfamilyControllerTest do
  use BirdserviceWeb.ConnCase

  alias Birdservice.Birds
  alias Birdservice.Birds.Subfamily

  @create_attrs %{
    families: "some families",
    name_latin: "some name_latin",
    name_sv: "some name_sv",
    slug: "some slug"
  }
  @update_attrs %{
    families: "some updated families",
    name_latin: "some updated name_latin",
    name_sv: "some updated name_sv",
    slug: "some updated slug"
  }
  @invalid_attrs %{families: nil, name_latin: nil, name_sv: nil, slug: nil}

  def fixture(:subfamily) do
    {:ok, subfamily} = Birds.create_subfamily(@create_attrs)
    subfamily
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all subfamilies", %{conn: conn} do
      conn = get(conn, Routes.subfamily_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create subfamily" do
    test "renders subfamily when data is valid", %{conn: conn} do
      conn = post(conn, Routes.subfamily_path(conn, :create), subfamily: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.subfamily_path(conn, :show, id))

      assert %{
               "id" => id,
               "families" => "some families",
               "name_latin" => "some name_latin",
               "name_sv" => "some name_sv",
               "slug" => "some slug"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.subfamily_path(conn, :create), subfamily: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update subfamily" do
    setup [:create_subfamily]

    test "renders subfamily when data is valid", %{conn: conn, subfamily: %Subfamily{id: id} = subfamily} do
      conn = put(conn, Routes.subfamily_path(conn, :update, subfamily), subfamily: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.subfamily_path(conn, :show, id))

      assert %{
               "id" => id,
               "families" => "some updated families",
               "name_latin" => "some updated name_latin",
               "name_sv" => "some updated name_sv",
               "slug" => "some updated slug"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, subfamily: subfamily} do
      conn = put(conn, Routes.subfamily_path(conn, :update, subfamily), subfamily: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete subfamily" do
    setup [:create_subfamily]

    test "deletes chosen subfamily", %{conn: conn, subfamily: subfamily} do
      conn = delete(conn, Routes.subfamily_path(conn, :delete, subfamily))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.subfamily_path(conn, :show, subfamily))
      end
    end
  end

  defp create_subfamily(_) do
    subfamily = fixture(:subfamily)
    %{subfamily: subfamily}
  end
end
