/*
Title: T2Ti ERP Pegasus                                                                
Description: Table Moor relacionada à tabela [EMPRESA] 
                                                                                
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

@DataClassName("Empresa")
class Empresas extends Table {
  @override
  String get tableName => 'EMPRESA';

  IntColumn? get id => integer().named('ID').autoIncrement()();
  TextColumn? get razaoSocial => text().named('RAZAO_SOCIAL').withLength(min: 0, max: 150).nullable()() as Column<String>?;
  TextColumn? get nomeFantasia => text().named('NOME_FANTASIA').withLength(min: 0, max: 150).nullable()() as Column<String>?;
  TextColumn? get cnpj => text().named('CNPJ').withLength(min: 0, max: 14).nullable()() as Column<String>?;
  TextColumn? get inscricaoEstadual => text().named('INSCRICAO_ESTADUAL').withLength(min: 0, max: 30).nullable()() as Column<String>?;
  TextColumn? get inscricaoMunicipal => text().named('INSCRICAO_MUNICIPAL').withLength(min: 0, max: 30).nullable()() as Column<String>?;
  TextColumn? get tipoRegime => text().named('TIPO_REGIME').withLength(min: 0, max: 1).nullable()() as Column<String>?; //"1-Lucro REAL" - "2-Lucro presumido" - "3-Simples nacional"
  TextColumn? get crt => text().named('CRT').withLength(min: 0, max: 1).nullable()() as Column<String>?; // "1-Simples Nacional" - "2-Simples Nacional - excesso de sublimite da receita bruta" - "3-Regime Normal"
  DateTimeColumn? get dataConstituicao => dateTime().named('DATA_CONSTITUICAO').nullable()() as Column<DateTime>?;
  TextColumn? get tipo => text().named('TIPO').withLength(min: 0, max: 1).nullable()() as Column<String>?; // "M=Matriz" - "F=Filial"
  TextColumn? get email => text().named('EMAIL').withLength(min: 0, max: 250).nullable()() as Column<String>?;
  RealColumn? get aliquotaPis => real().named('ALIQUOTA_PIS').nullable()() as Column<double>?;
  RealColumn? get aliquotaCofins => real().named('ALIQUOTA_COFINS').nullable()() as Column<double>?;
  TextColumn? get logradouro => text().named('LOGRADOURO').withLength(min: 0, max: 250).nullable()() as Column<String>?;
  TextColumn? get numero => text().named('NUMERO').withLength(min: 0, max: 10).nullable()() as Column<String>?;
  TextColumn? get complemento => text().named('COMPLEMENTO').withLength(min: 0, max: 100).nullable()() as Column<String>?;
  TextColumn? get cep => text().named('CEP').withLength(min: 0, max: 9).nullable()() as Column<String>?;
  TextColumn? get bairro => text().named('BAIRRO').withLength(min: 0, max: 100).nullable()() as Column<String>?;
  TextColumn? get cidade => text().named('CIDADE').withLength(min: 0, max: 100).nullable()() as Column<String>?;
  TextColumn? get uf => text().named('UF').withLength(min: 0, max: 2).nullable()() as Column<String>?;
  TextColumn? get fone => text().named('FONE').withLength(min: 0, max: 15).nullable()() as Column<String>?;
  TextColumn? get contato => text().named('CONTATO').withLength(min: 0, max: 30).nullable()() as Column<String>?;
  IntColumn? get codigoIbgeCidade => integer().named('CODIGO_IBGE_CIDADE').nullable()() as Column<int>?;
  IntColumn? get codigoIbgeUf => integer().named('CODIGO_IBGE_UF').nullable()() as Column<int>?;
  BlobColumn? get logotipo => blob().named('LOGOTIPO').nullable()() as Column<Uint8List>?;
  BoolColumn? get registrado => boolean().named('REGISTRADO').nullable()() as Column<bool>?;
  TextColumn? get naturezaJuridica => text().named('NATUREZA_JURIDICA').withLength(min: 0, max: 200).nullable()() as Column<String>?;
  TextColumn? get emailPagamento => text().named('EMAIL_PAGAMENTO').withLength(min: 0, max: 250).nullable()() as Column<String>?;
  BoolColumn? get simei => boolean().named('SIMEI').nullable()() as Column<bool>?;
  DateTimeColumn? get dataRegistro => dateTime().named('DATA_REGISTRO').nullable()() as Column<DateTime>?;
  TextColumn? get horaRegistro => text().named('HORA_REGISTRO').withLength(min: 0, max: 8).nullable()() as Column<String>?;
}