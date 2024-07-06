defmodule Cafe.Orders.OrderItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "order_items" do
    field :quantity, :integer
    belongs_to :order, Cafe.Orders.Order
    belongs_to :item, Cafe.Inventory.Item

    timestamps()
  end

  def changeset(order_item, attrs) do
    order_item
    |> cast(attrs, [:quantity, :order_id, :item_id])
    |> validate_required([:quantity, :item_id])
  end
end
