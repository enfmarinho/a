defmodule Codigobarras.Encoder do
  def validar_codigo_barras(codigo) when is_list(codigo) do
    if length(codigo) == 44 ,do: {:ok , codigo}
  else
    {:error , "O código de barras deve conter exatamente 44 dígitos "}
  end

  def ler_lista() do
    IO.puts("Digite os 44 dígitos do código de barras: ")

    intput = IO.gets("")
      |>String.trim()
      |>String.split(" ")
      |>Enum.map(&String.to_integer/1)

    if length(input) == 44 ,do: {:ok , input}

    #precisa agora tratar cada espaço corretamente
  end
  #
end


'''
  def receber_codigo_barras_do_usuario() do
    case ler_lista_44_digitos() do
      {:ok, codigo} ->
        IO.puts("Código de barras lido: #{inspect(codigo)}")
        codigo
      {:error, mensagem} ->
        IO.puts("Erro ao ler código de barras: #{mensagem}")
        receber_codigo_barras_do_usuario() # Chama novamente a função se houver erro
    end
  end
'''
