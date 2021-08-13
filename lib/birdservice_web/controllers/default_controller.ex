defmodule BirdserviceWeb.DefaultController do
  use BirdserviceWeb, :controller

  def index(conn, _params) do
    text conn, "BirdserviceWeb!"
  end
end
