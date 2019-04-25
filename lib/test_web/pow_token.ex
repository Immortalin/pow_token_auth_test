defmodule Test.Pow.Plug do
  use Pow.Plug.Base

  def fetch(conn, config) do
    user = Test.Guardian.Plug.current_resource(conn)

    {conn, user}
  end

  def create(conn, user, config) do
    conn = Test.Guardian.Plug.sign_in(conn, user)

    {conn, user}
  end

  def delete(conn, config) do
    Test.Guardian.Plug.sign_out(conn)
  end
end
