import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus{
  Online,
  Offline,
  Connecting
}
class SocketProvider with ChangeNotifier{
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;

  SocketProvider(){
    this._initConfig();
  }
  void _initConfig() {
    this._socket = IO.io('http://10.0.2.2:4000/', {
      'transports': ['websocket'],
      'autoConnect': true,
    });
    this._socket.on('connect', (_) {
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    this._socket.on('disconnect', (_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    // socket.on('nuevo-mensaje', (payload) {
    //   print('Nuevo Mensaje: ${payload}');
    // });

  }
    //socket.connect();
}