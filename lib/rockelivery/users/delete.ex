defmodule Rockelivery.Users.Delete do
  alias Rockelivery.Error
  alias Rockelivery.Repo
  alias Rockelivery.Users.User

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> Repo.delete(user)
    end
  end
end
