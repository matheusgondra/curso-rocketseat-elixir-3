defmodule RockeliveryWeb.UserController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Users.User

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rockelivery.create_user(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
end
