defmodule Birdservice.Repo.Migrations.AddOrderToFamily do
  use Ecto.Migration

  def change do
    alter table(:families) do
      add :order_id, references(:orders)
    end
  end
end
