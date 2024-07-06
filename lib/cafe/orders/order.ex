defmodule Cafe.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :status, :string
    field :name, :string
    has_many :order_items, Cafe.Orders.OrderItem

    timestamps()
  end

  def changeset(order, attrs) do
    order
    |> cast(attrs, [:status, :name])
    |> validate_required([:status, :name])
    |> cast_assoc(:order_items, with: &Cafe.Orders.OrderItem.changeset/2)
  end
end
