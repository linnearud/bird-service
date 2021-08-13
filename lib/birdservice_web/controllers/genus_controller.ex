defmodule BirdserviceWeb.GenusController do
  use BirdserviceWeb, :controller

  alias Birdservice.Birds
  alias Birdservice.Birds.Genus

  action_fallback BirdserviceWeb.FallbackController

  def index(conn, _params) do
    genera = Birds.list_genera()
    render(conn, "index.json", genera: genera)
  end

  def create(conn, %{"genus" => genus_params}) do
    with {:ok, %Genus{} = genus} <- Birds.create_genus(genus_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.genus_path(conn, :show, genus))
      |> render("show.json", genus: genus)
    end
  end

  def show(conn, %{"id" => id}) do
    genus = Birds.get_genus!(id)
    render(conn, "show.json", genus: genus)
  end

  def update(conn, %{"id" => id, "genus" => genus_params}) do
    genus = Birds.get_genus!(id)

    with {:ok, %Genus{} = genus} <- Birds.update_genus(genus, genus_params) do
      render(conn, "show.json", genus: genus)
    end
  end

  def delete(conn, %{"id" => id}) do
    genus = Birds.get_genus!(id)

    with {:ok, %Genus{}} <- Birds.delete_genus(genus) do
      send_resp(conn, :no_content, "")
    end
  end
end
