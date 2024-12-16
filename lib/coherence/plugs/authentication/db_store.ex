defprotocol Coherence.DbStore do
  @moduledoc """
  Database persistence of current_user data.

  Implement this protocol to add database storage, allowing session
  data to survive application restarts.
  """
  @fallback_to_any true

  @type schema :: Ecto.Schema.t() | map() | nil

  @doc """
  Get authenticated user data.
  """
  @spec get_user_data(schema, String.t() | map(), atom) :: schema
  def get_user_data(resource, credentials, id_key)

  @doc """
  Save authenticated user data in the database.
  """
  @spec put_credentials(schema, String.t() | map(), atom) :: schema
  def put_credentials(resource, credentials, id_key)

  @doc """
  Delete current user credentials.
  """
  @spec delete_credentials(schema, String.t() | map()) :: schema
  def delete_credentials(resource, credentials)

  @doc """
  Delete all logged in users.
  """
  @spec delete_user_logins(schema) :: nil
  def delete_user_logins(resource)
end

defimpl Coherence.DbStore, for: Any do
  def get_user_data(schema, _, _), do: schema
  def put_credentials(schema, _, _), do: schema
  def delete_credentials(schema, _), do: schema
  def delete_user_logins(_schema), do: nil
end
