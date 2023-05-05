import 'package:chat_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final usuarios = [
    Usuario(online: true, email: "maria@gmail.com", nombre: "Maria", uid: "1"),
    Usuario(online: false, email: "juan@gmail.com", nombre: "Juan", uid: "2"),
    Usuario(online: true, email: "maria@gmail.com", nombre: "Maria", uid: "1"),
    Usuario(online: false, email: "juan@gmail.com", nombre: "Juan", uid: "2"),
    Usuario(online: true, email: "maria@gmail.com", nombre: "Maria", uid: "1"),
    Usuario(online: false, email: "juan@gmail.com", nombre: "Juan", uid: "2"),
    Usuario(online: true, email: "maria@gmail.com", nombre: "Maria", uid: "1"),
    Usuario(online: false, email: "juan@gmail.com", nombre: "Juan", uid: "2"),
    Usuario(online: true, email: "maria@gmail.com", nombre: "Maria", uid: "1"),
    Usuario(online: false, email: "juan@gmail.com", nombre: "Juan", uid: "2"),
    Usuario(online: true, email: "maria@gmail.com", nombre: "Maria", uid: "1"),
    Usuario(online: false, email: "juan@gmail.com", nombre: "Juan", uid: "2"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black54,
        title: const Text("Mi nombre"),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: Icon(Icons.check_circle, color: Colors.blue.shade400),
          )
        ],
      ),
      body: SmartRefresher(
        controller: refreshController,
        onRefresh: _cargarUsuarios,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue.shade400),
          waterDropColor: Colors.blue.shade400,
        ),
        child: _listViewUsuarios(),
      ),
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      itemBuilder: (context, index) => _usuarioListTile(usuarios[index]),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: usuarios.length,
      physics: const BouncingScrollPhysics(),
    );
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Text(usuario.nombre.substring(0, 2))),
      trailing: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color:
                usuario.online ? Colors.green.shade200 : Colors.red.shade200),
      ),
    );
  }

  _cargarUsuarios() async {
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }
}
