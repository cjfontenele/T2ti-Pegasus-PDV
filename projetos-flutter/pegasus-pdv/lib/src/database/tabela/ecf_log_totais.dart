/*
Title: T2Ti ERP Pegasus                                                                
Description: Table Moor relacionada à tabela [ECF_LOG_TOTAIS] 
                                                                                
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

@DataClassName("EcfLogTotais")
class EcfLogTotaiss extends Table {
  @override
  String get tableName => 'ECF_LOG_TOTAIS';

  IntColumn? get id => integer().named('ID').autoIncrement()();
  IntColumn? get tipoPagamento => integer().named('TIPO_PAGAMENTO').nullable()() as Column<int>?;
  IntColumn? get produto => integer().named('PRODUTO').nullable()() as Column<int>?;
  IntColumn? get r01 => integer().named('R01').nullable()() as Column<int>?;
  IntColumn? get r02 => integer().named('R02').nullable()() as Column<int>?;
  IntColumn? get r03 => integer().named('R03').nullable()() as Column<int>?;
  IntColumn? get r04 => integer().named('R04').nullable()() as Column<int>?;
  IntColumn? get r05 => integer().named('R05').nullable()() as Column<int>?;
  IntColumn? get r06 => integer().named('R06').nullable()() as Column<int>?;
  IntColumn? get r07 => integer().named('R07').nullable()() as Column<int>?;
}