/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [COMPRA_PEDIDO_DETALHE] 
                                                                                
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

import 'package:pegasus_pdv/src/database/database.dart';
import 'package:pegasus_pdv/src/database/database_classes.dart';

part 'compra_pedido_detalhe_dao.g.dart';

@UseDao(tables: [
          CompraPedidoDetalhes,
          Produtos,
		])
class CompraPedidoDetalheDao extends DatabaseAccessor<AppDatabase> with _$CompraPedidoDetalheDaoMixin {
  final AppDatabase db;

  CompraPedidoDetalheDao(this.db) : super(db);

  Future<List<CompraPedidoDetalhe>> consultarLista() => select(compraPedidoDetalhes).get();

  Future<List<CompraPedidoDetalhe>> consultarListaFiltro(String campo, String valor) async {
    return (customSelect("SELECT * FROM COMPRA_PEDIDO_DETALHE WHERE " + campo + " like '%" + valor + "%'", 
                                readsFrom: { compraPedidoDetalhes }).map((row) {
                                  return CompraPedidoDetalhe.fromData(row.data, db);  
                                }).get());
  }

  Future<List<CompraDetalhe>> consultarListaComProduto(int? pId) {
    final consulta = select(compraPedidoDetalhes)
      .join([
        leftOuterJoin(produtos, produtos.id.equalsExp(compraPedidoDetalhes.idProduto)),
      ]);

    consulta.where(compraPedidoDetalhes.idCompraPedidoCabecalho.equals(pId));

    return consulta.map((row) {
        final compraDetalhe = row.readTableOrNull(compraPedidoDetalhes);
        final produto = row.readTableOrNull(produtos);

        return CompraDetalhe(compraPedidoDetalhe: compraDetalhe, produto: produto);
      }).get();
  }

  Stream<List<CompraPedidoDetalhe>> observarLista() => select(compraPedidoDetalhes).watch();

  Future<CompraPedidoDetalhe?> consultarObjeto(int pId) {
    return (select(compraPedidoDetalhes)..where((t) => t.id.equals(pId))).getSingleOrNull();
  } 

  Future<int> inserir(Insertable<CompraPedidoDetalhe> pObjeto) {
    return transaction(() async {
      final idInserido = await into(compraPedidoDetalhes).insert(pObjeto);
      return idInserido;
    });    
  } 

  Future<bool> alterar(Insertable<CompraPedidoDetalhe> pObjeto) {
    return transaction(() async {
      return update(compraPedidoDetalhes).replace(pObjeto);
    });    
  } 

  Future<int> excluir(Insertable<CompraPedidoDetalhe> pObjeto) {
    return transaction(() async {
      return delete(compraPedidoDetalhes).delete(pObjeto);
    });    
  }

  
}