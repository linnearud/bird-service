defmodule BirdserviceWeb.SubfamilyController do
  use BirdserviceWeb, :controller

  alias Birdservice.Birds
  alias Birdservice.Birds.Subfamily

  action_fallback BirdserviceWeb.FallbackController

  def index(conn, _params) do
    subfamilies = Birds.list_subfamilies()
    render(conn, "index.json", subfamilies: subfamilies)
  end

  def create(conn, %{"subfamily" => subfamily_params}) do
    with {:ok, %Subfamily{} = subfamily} <- Birds.create_subfamily(subfamily_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.subfamily_path(conn, :show, subfamily))
      |> render("show.json", subfamily: subfamily)
    end
  end

  def show(conn, %{"id" => id}) do
    subfamily = Birds.get_subfamily!(id)
    render(conn, "show.json", subfamily: subfamily)
  end

  def update(conn, %{"id" => id, "subfamily" => subfamily_params}) do
    subfamily = Birds.get_subfamily!(id)

    with {:ok, %Subfamily{} = subfamily} <- Birds.update_subfamily(subfamily, subfamily_params) do
      render(conn, "show.json", subfamily: subfamily)
    end
  end

  def delete(conn, %{"id" => id}) do
    subfamily = Birds.get_subfamily!(id)

    with {:ok, %Subfamily{}} <- Birds.delete_subfamily(subfamily) do
      send_resp(conn, :no_content, "")
    end
  end
end
