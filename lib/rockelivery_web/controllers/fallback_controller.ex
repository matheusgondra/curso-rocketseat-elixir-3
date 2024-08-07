defmodule RockeliveryWeb.FallbackController do
  use RockeliveryWeb, :controller

  alias RockeliveryWeb.ErrorJSON

  def call(conn, {:error, %{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorJSON)
    |> render(:error, result: result)
  end
end
