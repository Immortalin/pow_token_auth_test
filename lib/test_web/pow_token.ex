defmodule Test.Pow.Plug do
  use Pow.Plug.Base

  @session_key :pow_user_token
  @salt "user salt"
  @max_age 86400

  def fetch(conn, config) do
    conn = Plug.Conn.fetch_session(conn)
    token = Plug.Conn.get_session(conn, @session_key)

    TestWeb.Endpoint
    |> Phoenix.Token.verify(@salt, token, max_age: @max_age)
    |> maybe_load_user(conn)
  end

  defp maybe_load_user({:ok, user_id}, conn), do: {conn, Test.Repo.get(Test.Users.User, user_id)}
  defp maybe_load_user({:error, _any}, conn), do: {conn, nil}

  def create(conn, user, config) do
    token = Phoenix.Token.sign(TestWeb.Endpoint, @salt, user.id)
    conn = Plug.Conn.put_session(conn, @session_key, token)

    {conn, user}
  end

  def delete(conn, config) do
    # token = get_token_from_session(conn)

    Plug.Conn.delete_session(conn, @session_key)
  end
end
