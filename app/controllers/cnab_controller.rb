class CnabController < ApplicationController
    
    def index
        
        @cnabs = Cnab.all
        
    end
    def show
        
    end
    
    
    def importar
        
        puts ("A APLICAÇÃO BATEU NA FUNÇÃO NO IMPORTAR")
        
        
        arquivo=params["CNAB_txt"].tempfile.path
        puts("ABRI O ARQUIVO, E ESTOU PROCESSANDO ELE")
        arraydefora=[]
        @soma=0
        
        

        
        File.foreach(arquivo) { |line|
        arraydefora.push(line)
    }
    def getData(linha)
        #pegando a data
        tipo_pag=linha[0,1]
        
        date_pag=linha[1,8]
        puts date_pag
        
        #pegando o valor
        
        @valor_pag=linha[9,10]
        puts @valor_pag
        #pegando o CPF
        
        cpf_pag=linha[19,11]
        puts cpf_pag
        
        #pegando o cartão
        
        card_pag=linha[30,12]
        puts card_pag
        
        #pegando hora
        
        hora_pag=linha[42,6]
        puts "hora_pag"
        
        
        #pegando o Nome do dono da loja
        
        dono_pag=linha[48,14]
        puts dono_pag
        
        #pegando o Nome do estabelecimento
        
        est_pag=linha[62,19]
        puts est_pag
        #est_pag é estabelecimento que foi pago
        
        
        
        if tipo_pag=="1"
            tipo_pag="Débito"
            @valor_pag=@valor_pag.to_f * (1)
            
            
        elsif tipo_pag=="2"
            tipo_pag="Boleto"
            @valor_pag=@valor_pag.to_f * (-1)
            
            
        elsif tipo_pag=="3"
            tipo_pag="Financiamento"
            @valor_pag=@valor_pag.to_f * (-1) 
            
            
            
        elsif tipo_pag=="4"
            tipo_pag="Crédito"
            @valor_pag=@valor_pag.to_f * (1) 
            
            
            
        elsif tipo_pag=="5"
            tipo_pag="Recebimento Empréstimo"
            @valor_pag=@valor_pag.to_f * (1) 
            
            
            
        elsif tipo_pag=="6"
            tipo_pag="Vendas"
            @valor_pag=@valor_pag.to_f * (1) 
            
            
            
        elsif tipo_pag=="7"
            print  tipo_pag="Recebimento TED"
            @valor_pag=@valor_pag.to_f * (1)
            
            
            
        elsif tipo_pag=="8"
            tipo_pag="Recebimento DOC"
            @valor_pag=@valor_pag.to_f * (1) 
            
            
        elsif tipo_pag=="9"
            tipo_pag="Aluguel"
            @valor_pag=@valor_pag.to_f * (-1) 
        end

        puts("=================")
        @soma=@soma+@valor_pag
        @saldo=@soma
        puts(@saldo)

         Cnab.create(
         tipo: tipo_pag,
         data: date_pag,
         valor: @valor_pag,
         cpf: cpf_pag,
         cartao: card_pag,
         hora: hora_pag,
         dono_da_loja:dono_pag,
         nome_da_loja:est_pag)
         
         

    end
    
    for line in arraydefora do
        # puts line
        getData(line)
        
        
    end
    redirect_to "/cnabs"
end

end
