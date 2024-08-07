defmodule RockeliveryWeb.UserJSON do
  def create(%{user: user}) do
    %{
      message: "User created successfully",
      user: user
    }
  end

  def show(%{user: user}), do: %{user: user}
end
