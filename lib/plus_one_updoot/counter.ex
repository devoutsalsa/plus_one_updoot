defmodule PlusOneUpdoot.Counter do
  alias PlusOneUpdoot.Email
  use Agent

  def start_link() do
    start_link(:noarg)
  end

  def start_link(_) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def increment_atom!(base_atom) when is_atom(base_atom) do
    Agent.get_and_update(__MODULE__, fn %{} = data ->
      with count <- get_or_initialize_count(data, base_atom),
           next_atom_str <- concat_atom_and_count(base_atom, count),
           next_atom <- String.to_atom(next_atom_str),
           next_data <- Map.put(data, base_atom, count + 1) do
        {next_atom, next_data}
      end
    end)
  end

  def increment_email!(%Email{domain: domain, local_part: local_part} = base_email) when is_binary(domain) and is_binary(local_part) do
    Agent.get_and_update(__MODULE__, fn %{} = data ->
      with count <- get_or_initialize_count(data, base_email),
           next_local_part <- concat_binary_and_count(local_part, count),
           next_email <- struct!(base_email, local_part: next_local_part),
           next_data <- Map.put(data, base_email, count + 1) do
        {next_email, next_data}
      end
    end)
  end

  def increment_module!(base_module) when is_atom(base_module) do
    Agent.get_and_update(__MODULE__, fn %{} = data ->
      with count <- get_or_initialize_count(data, base_module),
           next_module_str <- concat_atom_and_count(base_module, count),
           {:ok, next_module} <- convert_module_str_to_module(next_module_str),
          next_data <- Map.put(data, base_module, count + 1) do
        {{:ok, next_module}, next_data}
      else
        {:error, _reason} = error ->
          {error, data}
      end
    end)
  end

  def increment_string!(base_string) when is_binary(base_string) do
    Agent.get_and_update(__MODULE__, fn %{} = data ->
      with count <- get_or_initialize_count(data, base_string),
           next_string <- concat_binary_and_count(base_string, count),
           next_data <- Map.put(data, base_string, count + 1) do
        {next_string, next_data}
      end
    end)
  end

  defp concat_binary_and_count(binary, count) when is_binary(binary) do
    binary <> Integer.to_string(count)
  end

  defp concat_atom_and_count(atom, count) when is_atom(atom) do
    atom
    |> Atom.to_string()
    |> case do
      str ->
        str <> Integer.to_string(count)
    end
  end

  defp convert_module_str_to_module(next_module_str) when is_binary(next_module_str) do
    existing_atom = String.to_existing_atom(next_module_str)

    {:error,
     "#{inspect(existing_atom)} is an EXISTING ATOM.  Use better fake module to generate a NONEXISTENT ATOM."}
  rescue
    x ->
      case x do
        %ArgumentError{message: "argument error"} ->
          {:ok, String.to_atom(next_module_str)}
      end
  end

  defp get_or_initialize_count(%{} = data, key) do
    Map.get(data, key, 0)
  end
end
