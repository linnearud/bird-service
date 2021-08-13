defmodule Birdservice.Repo.Migrations.AddImageToOrder do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      add :image_id, references("images")
    end
  end
end
