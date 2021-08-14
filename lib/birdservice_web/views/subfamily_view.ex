defmodule BirdserviceWeb.SubfamilyView do
  use BirdserviceWeb, :view
  alias BirdserviceWeb.SubfamilyView
  alias BirdserviceWeb.GenusView

  def render("index.json", %{subfamilies: subfamilies}) do
    %{data: render_many(subfamilies, SubfamilyView, "subfamily.json")}
  end

  def render("show.json", %{subfamily: subfamily}) do
    %{data: render_one(subfamily, SubfamilyView, "subfamily.json")}
  end

  def render("subfamily.json", %{subfamily: subfamily}) do
    if Ecto.assoc_loaded?(subfamily.genera) do
      %{id: subfamily.id,
        slug: subfamily.slug,
        name_latin: subfamily.name_latin,
        name_sv: subfamily.name_sv,
        genera: render_many(subfamily.genera, GenusView, "genus.json")
      }
    else
      %{id: subfamily.id,
        slug: subfamily.slug,
        name_latin: subfamily.name_latin,
        name_sv: subfamily.name_sv,
      }
    end
  end
end
