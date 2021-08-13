defmodule BirdserviceWeb.FamilyController do
  use BirdserviceWeb, :controller

  alias Birdservice.Birds
  alias Birdservice.Birds.Family

  action_fallback BirdserviceWeb.FallbackController

  def index(conn, _params) do
    families = Birds.list_families()
    render(conn, "index.json", families: families)
  end

  def create(conn, %{"family" => family_params}) do
    with {:ok, %Family{} = family} <- Birds.create_family(family_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.family_path(conn, :show, family))
      |> render("show.json", family: family)
    end
  end

  def show(conn, %{"id" => id}) do
    family = Birds.get_family!(id)
    render(conn, "show.json", family: family)
  end

  def update(conn, %{"id" => id, "family" => family_params}) do
    family = Birds.get_family!(id)

    with {:ok, %Family{} = family} <- Birds.update_family(family, family_params) do
      render(conn, "show.json", family: family)
    end
  end

  def delete(conn, %{"id" => id}) do
    family = Birds.get_family!(id)

    with {:ok, %Family{}} <- Birds.delete_family(family) do
      send_resp(conn, :no_content, "")
    end
  end
end
