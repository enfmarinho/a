defmodule Codigobarras.Encoder do
  # digito 1 a 3
  defp ler_codigo_banco(lista) when is_list(lista) do
    IO.puts("Digite o código do banco: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO retornar lista
    case length(input) == 3 do
      true -> {:ok , input} #
      false -> {:error , "Número incorreto "}
    end

  end

  #digito 4
  defp ler_moeda( lista) when is_list(lista) do

    IO.puts("Digite o código da moeda: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO retornar lista
    case length(input) == 1 do
      true -> {:ok , input}
      false -> {:error , "Número incorreto "}
    end 
  end
  
  # fator de vencimento, digitos 6 a 9
  defp ler_data_vencimento( lista) when is_list(lista) do
    IO.puts("Digite a data de vencimento DD/MM/AAAA: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("/" , trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO calcular e retornar valor de vencimento

    # TODO retornar lista
    case length(input) == 8 do
      true -> {:ok , input}
      false -> {:error , "Número incorreto"}
    end
  end
  
  # digitos 10 a 19
  defp ler_valor( lista) when is_list(lista) do
    IO.puts("Digite o valor: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO retornar lista
    # TODO fill with 0s
    {:ok , input}
  end


  # digitos 20 a 30
  defp ler_convenio(size , lista) when is_list(lista) do
    IO.puts("Digite o tipo de convênio: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)

    # TODO retornar lista
    case length(input) == size do
      true -> {:ok , input}
      false -> {:error , "Número incorreto "}
    end
  end

  # digitos 31, 44
  defp ler_dados_especificos(size , lista) when is_list(lista) do
      IO.puts("Digite os dados_especificos: ")
    input = IO.gets("")
    |> String.trim()
    |> String.split("" , trim: true)
    |> Enum.map(&String.to_integer/1)
    # TODO retornar lista
    case length(input) == size do
      true -> {:ok , input}
      false -> {:error , "Número incorreto "}
    end
  end


  defp calcular_dv_codigo_barra(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos) do
    # TODO
    1
  end


  defp calcular_dv_campo1(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos) do
    # TODO
    1
  end

  defp calcular_dv_campo2(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos) do
    # TODO
    1
  end

  defp calcular_dv_campo3(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos) do
    # TODO
    1
  end

  defp imprimir_campo_1(codigo_banco, moeda, digitos) do
    "Campo 1: "|> IO.puts
    codigo_banco |> IO.inspect
    moeda |> IO.puts
    [head | tail] = digitos
    head |> IO.puts
    '.' |> IO.puts
    tail |> IO.inspect
    calcular_dv_campo1(codigo_banco, moeda, digitos) |> IO.puts
  end

  defp imprimir_campo_2(digitos, dados_especificos) do
    "Campo 2: "|> IO.write
    [ _ | rest ] = Enum.split(digitos, 5)
    [ before_dot | after_dot ] = Enum.slice(digitos, 5)
    before_dot |> IO.inspect
    ' ' |> IO.puts
    after_dot |> IO.inspect
    [ head | _ ] = Enum.split(dados_especificos, 3)
    head |> IO.inspect
  end

  defp imprimir_campo_3(dados_especificos) do
    "Campo 3: "|> IO.write
    [ _ | tail ] = Enum.split(dados_especificos, 6)
    tail |> IO.inspect
  end

  defp imprimir_campo_5(data_vencimento, valor) do
    "Campo 5: "|> IO.write
    data_vencimento |> IO.inspect
    valor |> IO.inspect
  end

  defp imprimir_linha_digitavel(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos, dv) do
    imprimir_campo_1(codigo_banco, moeda, digitos)
    imprimir_campo_2(digitos, dados_especificos)
    imprimir_campo_3(dados_especificos)
    "Campo 4: #{dv}" |> IO.puts
    imprimir_campo_5(data_vencimento, valor)
  end

  defp gerar_codigo_barra(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos) do 
     # TODO
  end

  def ler_registros() do
    codigo_banco = ler_codigo_banco()
    moeda = ler_moeda()
    data_vencimento = ler_data_vencimento()
    valor = ler_valor()
    convenio = ler_convenio()
    dados_especificos = ler_dados_especificos()
    dv = calcular_dv_codigo_barra(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos)
     
    imprimir_linha_digitavel(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos, dv) 
    gerar_codigo_barra(codigo_banco, moeda, data_vencimento, valor, convenio, dados_especificos, dv)
  end
end

