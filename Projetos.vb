Sub Tabela_Simples()
    'Preenche os dados de determinas células
    Range("a5").Value = "Segurado"      'utilizar aspas para texto
    Range("b5").Value = "Cidade"
    Range("c5").Value = "Plano"
    Range("d5").Value = "Valor Pessoa"
    Range("e5").Value = "Valor Dependente"
    Range("f5").Value = "Quantidade"
    Range("g5").Value = "Valor Total"
    'Efetuando o cadastro do cliente
    'inserir informações no objeto Célula
    Range("a6").Value = "Viviane"
    Range("b6").Value = "Guarulhos"
    Range("c6").Value = "Master"
    Range("d6").Value = "200"
    Range("e6").Value = "50"
    Range("f6").Value = "2"
    'Range("g6").Value = Range("d6").Value + Range("e6").Value * Range("f6").Value'
    'Realiza cálculo
    Range("g6").Value = "=d6+e6*f6"
End Sub

'Inserir Valores

Sub Tabela_Deslocamento_linha()
    'trabalhando com macro RELATIVA
    'Activecell = celula ativa / selecionada
    'ir para a ultima celular da planilha
    Range("a1048576").Select
    'Ctrl + Seta para cima - para chegar na ultima celula preenchida
    ActiveCell.End(xlUp).Select
    'descer uma linha e clicar
    ActiveCell.Offset(1, 0).Select
    'celula ativa recebe o nome do segurado
    ActiveCell.Value = InputBox("Insira o nome do Segurado")
    'celula ao lado da celula ativa recebe a cidade
    ActiveCell.Offset(0, 1).Value = InputBox("Cidade")
    'segunda celula ao lado da celula ativa recebe o plano
    ActiveCell.Offset(0, 2).Value = InputBox("Tipo do Plano")
    ActiveCell.Offset(0, 3).Value = InputBox("Digite o Valor do Segurado")
    ActiveCell.Offset(0, 4).Value = InputBox("Valor do Dependente")
    ActiveCell.Offset(0, 5).Value = InputBox("Quantidade de Dependentes")
    ActiveCell.Offset(0, 6).Value = ActiveCell.Offset(0, 3).Value + ActiveCell.Offset(0, 4).Value * ActiveCell.Offset(0, 5).Value
    MsgBox "Cadastro concluido com sucesso!!!"
End Sub

Sub cadastrar()
    Range("b1048576").Select
    ActiveCell.End(xlUp).Select
    ActiveCell.Offset(1, 0).Select
    ActiveCell.Value = InputBox("Digite o nome do participante")
    ActiveCell.Offset(0, 1).Value = InputBox("Informe o e-mail")
End Sub

'utilizando IF
Sub auto_open_If_ElseIf()
    'Criar variavel info do tipo String
    Dim info As String
    Sheets("entrada").Select
    'variavel recebe conteudo digitado
    info = InputBox("Informe o nome do usuário")
    'Se conteudo da variavel for "abc" então...
    'If UCase(info) = "ABC" Then
    If LCase(info) = "abc" Then
        Select Case Houser(Now)
        Case Is < 12
            MsgBox "Bom Dia", vbInformation
        Case Is < 18
            MsgBox "Boa Tarde", vbInformation
        Case Else
            MsgBox "Boa Noite", vbInformation
        End Select
        
        MsgBox "Bem vindo ao sistema!", vbExclamation
        Sheets("despesas").Select
    Else
        MsgBox "Acesso Negado", vbCritical
        Application.Quit
    End If
End Sub
Sub auto_open()
    'Criar variavel info do tipo String
    Dim info As String
    Sheets("entrada").Select
    'variavel recebe conteudo digitado
    info = InputBox("Informe o nome do usuário")
    'Se conteudo da variavel for "abc" então...
    'If UCase(info) = "ABC" Then
    If LCase(info) = "abc" Then
        If Hour(Now) < 12 Then
            MsgBox "Bom Dia"
        ElseIf Hour(Now) < 18 Then 'senaoSe <condicao>
            MsgBox "Boa Tarde"
        Else                        'caso contratio
            MsgBox "Boa Noite"
        End If
        MsgBox "Bem vindo ao sistema!"
        Sheets("despesas").Select
    Else
        MsgBox "Acesso Negado", vbCritical
        Application.Quit
    End If
End Sub
Sub auto_close()
    ActiveWorkbook.Save
    MsgBox "Até Breve!"
End Sub

Sub auto_open_exercicio_nome()
    'Criar variavel info do tipo String
    Dim nome As String
    Sheets("entrada").Select
    'variavel recebe conteudo digitado
    nome = InputBox("Informe o nome do usuário")
    'Se conteudo da variavel for "abc" então...
    If nome = "Ana Paula de Moura" Or nome = "Pedro Toledo" Then
        MsgBox "Bem vindo ao sistema!"
        Sheets("despesas").Select
    Else
        MsgBox "Acesso Negado", vbCritical
        Application.Quit
    End If
End Sub
Sub Cadastrar()
    Range("a1048576").End(xlUp).Offset(1, 0).Select
    ActiveCell = InputBox("Digite o nome do aluno")
    ActiveCell.Offset(0, 2) = InputBox("Informe a sigla do Estado")
    If UCase(ActiveCell.Offset(0, 2)) = "RJ" Then
        ActiveCell.Offset(0, 1) = "Rio de Janeiro"
    ElseIf UCase(ActiveCell.Offset(0, 2)) = "SP" Then
ActiveCell.Offset(0, 1) = "São Paulo"
    ElseIf UCase(ActiveCell.Offset(0, 2)) = "MG" Then
        ActiveCell.Offset(0, 1) = "Minas Gerais"
    ElseIf UCase(ActiveCell.Offset(0, 2)) = "TO" Then
        ActiveCell.Offset(0, 1) = "Tocantins"
    Else
        MsgBox "Sigla Inválida"
        ActiveCell.ClearContents
        ActiveCell.Offset(0, 3).ClearContents
    End If
End Sub
Sub Cadastrar2()
    Range("a1048576").End(xlUp).Offset(1, 0).Select
    ActiveCell = InputBox("Digite o nome do aluno")
    ActiveCell.Offset(0, 2) = InputBox("Informe a sigla do Estado")
    Select Case UCase(ActiveCell.Offset(0, 2))
    Case Is = "RJ"
        ActiveCell.Offset(0, 1) = "Rio de Janeiro"
    Case Is = "SP"
    ActiveCell.Offset(0, 1) = "São Paulo"
    Case Is = "MG"
        ActiveCell.Offset(0, 1) = "Minas Gerais"
    Case Is = "TO"
        ActiveCell.Offset(0, 1) = "Tocantins"
    Case Else
        MsgBox "Sigla Inválida"
        ActiveCell.ClearContents
        ActiveCell.Offset(0, 2).ClearContents
    End Select
End Sub
