defmodule PlusOneUpdoot.Counter do
  use Agent

  def start_link() do
    start_link(:noarg)    
  end

  def start_link(_) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def increment_module!(base_module) when is_atom(base_module) do
    Agent.get_and_update(__MODULE__, fn %{} = data ->
      with \
        count <- get_or_initialize_count(data, base_module),
        next_module_str <- concat_module_and_count(base_module, count),
        {:ok, next_module} <- convert_module_str_to_module(next_module_str)
      do
        {{:ok, next_module}, Map.put(data, base_module, count + 1)}
      else
        {:error, _reason} = error ->
          {error, data}
      end
    end)
  end

  defp concat_module_and_count(module, count) do
    module
    |> Atom.to_string()
    |> case do 
      str -> 
        str <> Integer.to_string(count)
    end
  end

  defp convert_module_str_to_module(next_module_str) do
    existing_atom = String.to_existing_atom(next_module_str)
    {:error, "#{inspect(existing_atom)} is an EXISTING ATOM.  Use better fake module to generate a NONEXISTENT ATOM."}
  rescue 
    x ->
      case x do
        %ArgumentError{message: "argument error"} -> 
          {:ok, String.to_atom(next_module_str)}
      end
  end

  defp get_or_initialize_count(data, key) do
    Map.get(data, key, 0)
  end
end
