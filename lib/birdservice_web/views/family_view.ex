defmodule BirdserviceWeb.FamilyView do
  use BirdserviceWeb, :view
  alias BirdserviceWeb.FamilyView
  alias BirdserviceWeb.SubfamilyView
  alias BirdserviceWeb.GenusView

  def render("index.json", %{families: families}) do
    %{data: render_many(families, FamilyView, "family.json")}
  end

  def render("show.json", %{family: family}) do
    %{data: render_one(family, FamilyView, "family.json")}
  end

  def render("family.json", %{family: family}) do
    if Ecto.assoc_loaded?(family.subfamilies) && Ecto.assoc_loaded?(family.genera) do
      %{id: family.id,
        slug: family.slug,
        name_latin: family.name_latin,
        name_sv: family.name_sv,
        subfamilies: render_many(family.subfamilies, SubfamilyView, "subfamily.json"),
        genera: render_many(family.genera, GenusView, "genus.json")
      }
    else
      %{id: family.id,
        slug: family.slug,
        name_latin: family.name_latin,
        name_sv: family.name_sv,
      }
    end
  end
end
