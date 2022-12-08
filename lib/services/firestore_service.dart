import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //obtener los productos
  Stream<QuerySnapshot> listarNoticias() {
    return FirebaseFirestore.instance.collection('noticias').snapshots();
    //int limite = 10;
    //return FirebaseFirestore.instance.collection('productos').where('stock', isLessThan: limite).snapshots();
  }

  //agregar
  Future agregar(String codNoticia, String tituloNoticia, String cuerpoNoticia,
      int icono) {
    return FirebaseFirestore.instance.collection('noticias').doc().set({
      'cod_noticia': codNoticia,
      'titulo_noticia': tituloNoticia,
      'cuerpo_noticia': cuerpoNoticia,
      'tipo': icono,
    });
  }

  //borrar
  Future borrar(String codNoticia) {
    return FirebaseFirestore.instance
        .collection('noticias')
        .doc(codNoticia)
        .delete();
  }
}
