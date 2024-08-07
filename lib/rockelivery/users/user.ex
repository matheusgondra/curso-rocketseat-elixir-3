defmodule Rockelivery.Users.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:age, :address, :cep, :cpf, :email, :name, :password]
  @update_params @required_params -- [:password]
  @derive {Jason.Encoder, only: [:id, :name, :email, :cpf, :age, :cep, :address]}

  schema "users" do
    field :address, :string
    field :age, :integer
    field :cep, :string
    field :cpf, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :name, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> do_validations(@required_params)
    |> put_password_hash()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @update_params)
    |> validate_required(@update_params)
    |> do_validations(@update_params)
    |> put_password_hash()
  end

  defp do_validations(changeset, fields) do
    changeset
    |> validate_required(fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:cep, is: 8)
    |> validate_length(:cpf, is: 11)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> unique_constraint(:cpf)
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, %{password_hash: Pbkdf2.hash_pwd_salt(password)})
  end

  defp put_password_hash(changeset), do: changeset
end
