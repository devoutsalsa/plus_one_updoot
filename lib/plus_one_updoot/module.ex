defmodule PlusOneUpdoot.Module do
  alias PlusOneUpdoot.Counter
  alias PlusOneUpdoot.RuntimeError, as: PlusOneUpdootRuntimeError
  
  def increment!(fake_module \\ FakeModule) when is_atom(fake_module) do
    try do
      [_ | _] = fake_module.module_info()

      raise PlusOneUpdootRuntimeError,
            "#{inspect(fake_module)} is a REAL module.  Use a FAKE module."
    rescue
      exception ->
        case exception do
          %UndefinedFunctionError{
            arity: 0,
            function: :module_info,
            message: nil,
            module: ^fake_module,
            reason: nil
          } ->
            case Counter.increment_module!(fake_module) do
              {:ok, unique_fake_module} ->
                unique_fake_module

              {:error, error_message} ->
                raise PlusOneUpdootRuntimeError, error_message
            end

          %PlusOneUpdootRuntimeError{} ->
            reraise exception, __STACKTRACE__
        end
    end
  end
end
