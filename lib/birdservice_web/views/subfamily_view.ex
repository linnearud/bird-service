defmodule BirdserviceWeb.SubfamilyView do
  use BirdserviceWeb, :view
  alias BirdserviceWeb.SubfamilyView

  def render("index.json", %{subfamilies: subfamilies}) do
    %{data: render_many(subfamilies, SubfamilyView, "subfamily.json")}
  end

  def render("show.json", %{subfamily: subfamily}) do
    %{data: render_one(subfamily, SubfamilyView, "subfamily.json")}
  end

  def render("subfamily.json", %{subfamily: subfamily}) do
    %{id: subfamily.id,
      families: subfamily.families,
      slug: subfamily.slug,
      name_latin: subfamily.name_latin,
      name_sv: subfamily.name_sv}
  end
end
