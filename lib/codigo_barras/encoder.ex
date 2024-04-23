defmodule Codigobarras.Encoder do
  def validar_codigo_barras(codigo) when is_list(codigo) do
    case length(codigo) == 44 do
      true -> {:ok , codigo}
      false -> {:error ,"Tem algo de errado"}
    end
  end

  def ler_lista(size) do
    IO.puts("Digite os proximos #{size} digitos do código de barras: ")

    input = IO.gets("")
      |>String.trim()
      |>String.split("", trim: true)
      |>Enum.map(&String.to_integer/1)

      case length(input) == size do
        true -> {:ok ,input}
        false -> {:error, "Número incorreto de dígitos. Por favor, insira exatamente #{size} dígitos."}
      end
  end

  #aqui eu gostaria de criar uma lista para salvar tudo e atualizar a cada leitura de um pedaço


  #ler o código do banco
  def ler_codigo_banco(codigo , lista , lista_codigo_banco) when is_list(codigo) and length(codigo) >=3 do

    {:ok , codigo_banco} = ler_lista(3) #ler os 3 dígitos e salvar na lista como os 3 primeiros dos 44

    case codigo_banco do
      {:ok , input} -> {:ok , [codigo_banco | lista] , [codigo_banco | lista_codigo_banco]}

      _ -> {:error , lista , lista_codigo_banco}

    end
    #aqui eu quero criar uma lista como uma cópia chamada lista_codigo_banco[3] que vai ser importante para gerar os 3 dígitos dos 47

  end

  #ler moeda
  def ler_moeda(codigo , lista) when is_list(lista) and length(codigo) >= 4 do

    {ok , moeda} = ler_lista(1)
    case moeda do
      {:ok , input} ->
         {ok , [moeda | lista]} #tem que ter os : no ok?

      _ -> {:error , lista}
    end
  end

  #ler o resto
end



#  def receber_codigo_barras_do_usuario() do
 #   case ler_lista_44_digitos() do
  #    {:ok, codigo} ->
   #     IO.puts("Código de barras lido: #{inspect(codigo)}")
    #    codigo
     # {:error, mensagem} ->
      #  IO.puts("Erro ao ler código de barras: #{mensagem}")
      #  receber_codigo_barras_do_usuario() # Chama novamente a função se houver erro
    #end
  #end
