defmodule BirdserviceWeb.OrderView do
  use BirdserviceWeb, :view
  alias BirdserviceWeb.OrderView

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{id: order.id,
      slug: order.slug,
      name_latin: order.name_latin,
      name_sv: order.name_sv,
      image_path: order.image_path,
    }
  end
end
