defmodule Codigobarras.Encoder do
  def validar_codigo_barras(codigo) when is_list(codigo) do
    case length(codigo) == 44 do
      true -> {:ok , codigo}
      false -> {:error ,"Tem algo de errado"}
    end
  end
  #PERGUNTAR AO PROFESSOR SE O ENCODER PRECISA LER BATCH POR BATCHES OU PODE LER DIRETO OS 44 DÍGITOS
  #TALVEZ SEJA MELHOR LER TODOS DE UMA VEZ SÓ

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


  def ler_codigo_banco(size,lista) when is_list(lista) and size>=3  do
    IO.puts("Digite o código do banco: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    case length(input) == size do
      true -> {:ok , input} #
      false -> {:error , "Número incorreto "}
    end

  end

  #pos 4
  def ler_moeda(size , lista) when is_list(lista) do

    IO.puts("Digite o código da moeda: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    case length(input) == size do
      true -> {:ok , input}
      false -> {:error , "Número incorreto "}
    end 
  end
  
  #pos 
  def ler_data_vencimento(size , lista) when is_list(lista) do
    IO.puts("Digite a data de vencimento DD/MM/AAAA: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    case length(input) == size do
      true -> {:ok , input}
      false -> {:error , "Número incorreto "}
    end
  end
  
  #valor 
  def ler_valor(size , lista) when is_list(lista) do
    IO.puts("Digite o valor: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    case length(input) == size do
      true -> {:ok , input}
      false -> {:error , "Número incorreto "}
    end
  end


  def convenio(size , lista) when is_list(lista) do
    IO.puts("Digite o tipo de convênio: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    case length(input) == size do
      true -> {:ok , input}
      false -> {:error , "Número incorreto "}
    end
  end

  def dados_especificos(size , lista) when is_list(lista) do
      IO.puts("Digite os dados_especificos: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    case length(input) == size do
      true -> {:ok , input}
      false -> {:error , "Número incorreto "}
    end
  end


  def function_read_all() do
    #essa função chama todas as funções acima e lê tudo 
    
  end
end

