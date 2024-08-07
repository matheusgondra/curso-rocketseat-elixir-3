defmodule RockeliveryWeb.UserJSON do
  def create(%{user: user}) do
    %{
      message: "User created successfully",
      user: user
    }
  end
end
