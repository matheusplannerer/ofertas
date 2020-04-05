import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ofertas/app/shared/models/perfil_empresa_model.dart';

class FeedService extends Disposable {
  //dispose will be called automatically

  getEmpresas({
    bool buscando,
    DocumentSnapshot lastDocument,
    int queryLimit,
  }) async {
    if (!buscando) {
      buscando = true;
      if (lastDocument == null) {
        print("LAST DOC");
        var doc = await Firestore.instance
            .collection('empresas')
            .limit(queryLimit)
            .getDocuments();
        for (var i = 0; i < doc.documents.length; i++) {
          PerfilEmpresaModel aux =
              PerfilEmpresaModel.fromJson(doc.documents[i].data);

          var docAux = await Firestore.instance
              .collection('ofertas')
              .where("mostrar", isEqualTo: true)
              .where('empresaDona', isEqualTo: aux.empresaID)
              .limit(1)
              .getDocuments();

          if (docAux.documents.length > 0) {
            // if (mounted)
            //   setState(() {
            //     if (!empresas.contains(aux)) empresas.add(aux);
            //   });
          }
        }

        if (doc.documents.length > 0)
          lastDocument = doc.documents[doc.documents.length - 1];
      } else {
        // if (hasMore) {
        //   var doc = await Firestore.instance
        //       .collection('empresas')
        //       .limit(queryLimit)
        //       .startAfterDocument(lastDocument)
        //       .getDocuments();

        //   if (doc.documents.length > 0) {
        //     hasMore = true;

        //     for (var i = 0; i < doc.documents.length; i++) {
        //       PerfilEmpresa aux = PerfilEmpresa.fromJson(
        //           doc.documents[i].data, doc.documents[i].documentID);

        //       var docAux = await Firestore.instance
        //           .collection('ofertas')
        //           .where("mostrar", isEqualTo: true)
        //           .where('empresaDona', isEqualTo: aux.empresaID)
        //           .limit(1)
        //           .getDocuments();

        //       if (docAux.documents.length > 0) {
        //         if (mounted) {
        //           if (!empresas.contains(aux)) {
        //             setState(() {
        //               print("DUPLICOU");
        //               empresas.add(aux);
        //             });
        //           }
        //         }
        //       }
        //     }
        //     if (doc.documents.length > 0)
        //       lastDocument = doc.documents[doc.documents.length - 1];
        //   } else {
        //     hasMore = false;
        //   }
        // }
      }
      // if (mounted)
      //   setState(() {
      //     carregou = true;
      //   });
      // print(empresas);
      buscando = false;
    }
  }

  @override
  void dispose() {}
}
