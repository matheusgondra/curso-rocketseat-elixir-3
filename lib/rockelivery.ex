defmodule Rockelivery do
  alias Rockelivery.Users.Create, as: UserCreate
  alias Rockelivery.Users.Get, as: GetCreate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(id), to: GetCreate, as: :by_id
end
