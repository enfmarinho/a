defmodule CodigobarrasTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Codigobarras

  test "Testing the reader of the bar code " do
    
    input_codigo_banco = "001\n"
    expected_codigo_banco = {:ok ,[0,0,1]}
    assert capture_io([input: input], fn -> assert Codigobarras.Encoder.ler_codigo_banco() == expected_codigo_banco end) == input

    #exemplo de teste 
    end

    test "Teste de códigos de barras com 44 dígitos" do
      
      #TODO
    end

    test "Teste de códigos de barras diferente de 44 dígitos" do
      
      #TODO
    end

    test "Linha digitável de 47 dígitos " do
      
      #TODO
    end

    test "Linha digitável diferente de 47 dígitos" do
      
      #TODO
    end

    test "Carregando código de barras e colocando em PNG" do
      
      #TODO
    end

    test "Encoder" do
      # TODO
      # input = "104\n9\n22-02-2024\n1062.75\n611447\n4000100040031663110\n"
      # expected_output = "Linha digital: 10496.11443 74000.100045 03166.31100 9 96510000106275\n"
      #
      # assert capture_io(input, Codigobarras.Encoder.ler_registros()) == expected_output
    end

  # test "Decodificador recebe "

end
