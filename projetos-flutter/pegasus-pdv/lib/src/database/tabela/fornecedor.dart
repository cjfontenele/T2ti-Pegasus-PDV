/*
Title: T2Ti ERP Pegasus                                                                
Description: Table Moor relacionada à tabela [FORNECEDOR] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
import 'package:moor/moor.dart';

@DataClassName("Fornecedor")
class Fornecedors extends Table {
  @override
  String get tableName => 'FORNECEDOR';

  IntColumn? get id => integer().named('ID').autoIncrement()();
  TextColumn? get nome => text().named('NOME').withLength(min: 0, max: 150).nullable()() as Column<String>?;
  TextColumn? get fantasia => text().named('FANTASIA').withLength(min: 0, max: 150).nullable()() as Column<String>?;
  TextColumn? get email => text().named('EMAIL').withLength(min: 0, max: 250).nullable()() as Column<String>?;
  TextColumn? get url => text().named('URL').withLength(min: 0, max: 250).nullable()() as Column<String>?;
  TextColumn? get cpfCnpj => text().named('CPF_CNPJ').withLength(min: 0, max: 14).nullable()() as Column<String>?;
  TextColumn? get rg => text().named('RG').withLength(min: 0, max: 20).nullable()() as Column<String>?;
  TextColumn? get orgaoRg => text().named('ORGAO_RG').withLength(min: 0, max: 20).nullable()() as Column<String>?;
  DateTimeColumn? get dataEmissaoRg => dateTime().named('DATA_EMISSAO_RG').nullable()() as Column<DateTime>?;
  TextColumn? get sexo => text().named('SEXO').withLength(min: 0, max: 1).nullable()() as Column<String>?;
  TextColumn? get inscricaoEstadual => text().named('INSCRICAO_ESTADUAL').withLength(min: 0, max: 30).nullable()() as Column<String>?;
  TextColumn? get inscricaoMunicipal => text().named('INSCRICAO_MUNICIPAL').withLength(min: 0, max: 30).nullable()() as Column<String>?;
  TextColumn? get tipoPessoa => text().named('TIPO_PESSOA').withLength(min: 0, max: 10).nullable()() as Column<String>?;
  DateTimeColumn? get dataCadastro => dateTime().named('DATA_CADASTRO').nullable()() as Column<DateTime>?;
  TextColumn? get logradouro => text().named('LOGRADOURO').withLength(min: 0, max: 250).nullable()() as Column<String>?;
  TextColumn? get numero => text().named('NUMERO').withLength(min: 0, max: 10).nullable()() as Column<String>?;
  TextColumn? get complemento => text().named('COMPLEMENTO').withLength(min: 0, max: 100).nullable()() as Column<String>?;
  TextColumn? get cep => text().named('CEP').withLength(min: 0, max: 8).nullable()() as Column<String>?;
  TextColumn? get bairro => text().named('BAIRRO').withLength(min: 0, max: 100).nullable()() as Column<String>?;
  TextColumn? get cidade => text().named('CIDADE').withLength(min: 0, max: 100).nullable()() as Column<String>?;
  TextColumn? get uf => text().named('UF').withLength(min: 0, max: 2).nullable()() as Column<String>?;
  TextColumn? get telefone => text().named('TELEFONE').withLength(min: 0, max: 15).nullable()() as Column<String>?;
  TextColumn? get celular => text().named('CELULAR').withLength(min: 0, max: 15).nullable()() as Column<String>?;
  TextColumn? get contato => text().named('CONTATO').withLength(min: 0, max: 50).nullable()() as Column<String>?;
  IntColumn? get codigoIbgeCidade => integer().named('CODIGO_IBGE_CIDADE').nullable()() as Column<int>?;
  IntColumn? get codigoIbgeUf => integer().named('CODIGO_IBGE_UF').nullable()() as Column<int>?;
}