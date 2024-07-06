defmodule Cafe.Repo.Migrations.Orders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :status, :string
      add :name, :string

      timestamps()
    end

    create table(:order_items) do
      add :quantity, :integer, null: false
      add :order_id, references(:orders, on_delete: :delete_all), null: false
      add :item_id, references(:items, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:order_items, [:order_id])
    create index(:order_items, [:item_id])
  end
end
