defmodule BirdserviceWeb.BirdControllerTest do
  use BirdserviceWeb.ConnCase

  alias Birdservice.Birds
  alias Birdservice.Birds.Bird

  @create_attrs %{
    characteristics: "some characteristics",
    hunt: "some hunt",
    link: "some link",
    name_en: "some name_en",
    name_latin: "some name_latin",
    name_sv: "some name_sv",
    slug: "some slug",
    spread: "some spread"
  }
  @update_attrs %{
    characteristics: "some updated characteristics",
    hunt: "some updated hunt",
    link: "some updated link",
    name_en: "some updated name_en",
    name_latin: "some updated name_latin",
    name_sv: "some updated name_sv",
    slug: "some updated slug",
    spread: "some updated spread"
  }
  @invalid_attrs %{characteristics: nil, hunt: nil, link: nil, name_en: nil, name_latin: nil, name_sv: nil, slug: nil, spread: nil}

  def fixture(:bird) do
    {:ok, bird} = Birds.create_bird(@create_attrs)
    bird
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all birds", %{conn: conn} do
      conn = get(conn, Routes.bird_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create bird" do
    test "renders bird when data is valid", %{conn: conn} do
      conn = post(conn, Routes.bird_path(conn, :create), bird: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.bird_path(conn, :show, id))

      assert %{
               "id" => id,
               "characteristics" => "some characteristics",
               "hunt" => "some hunt",
               "link" => "some link",
               "name_en" => "some name_en",
               "name_latin" => "some name_latin",
               "name_sv" => "some name_sv",
               "slug" => "some slug",
               "spread" => "some spread"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.bird_path(conn, :create), bird: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update bird" do
    setup [:create_bird]

    test "renders bird when data is valid", %{conn: conn, bird: %Bird{id: id} = bird} do
      conn = put(conn, Routes.bird_path(conn, :update, bird), bird: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.bird_path(conn, :show, id))

      assert %{
               "id" => id,
               "characteristics" => "some updated characteristics",
               "hunt" => "some updated hunt",
               "link" => "some updated link",
               "name_en" => "some updated name_en",
               "name_latin" => "some updated name_latin",
               "name_sv" => "some updated name_sv",
               "slug" => "some updated slug",
               "spread" => "some updated spread"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, bird: bird} do
      conn = put(conn, Routes.bird_path(conn, :update, bird), bird: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete bird" do
    setup [:create_bird]

    test "deletes chosen bird", %{conn: conn, bird: bird} do
      conn = delete(conn, Routes.bird_path(conn, :delete, bird))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.bird_path(conn, :show, bird))
      end
    end
  end

  defp create_bird(_) do
    bird = fixture(:bird)
    %{bird: bird}
  end
end
