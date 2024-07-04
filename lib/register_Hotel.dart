import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterHotel extends StatefulWidget {
  @override
  _RegisterHotelState createState() => _RegisterHotelState();
}

class _RegisterHotelState extends State<RegisterHotel> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? hotelName;
  String? address;
  String? phoneNumber;
  String? email;
  String? roomType;
  int? roomCapacity;
  double? pricePerNight;
  bool wifi = false;
  bool parking = false;
  bool restaurant = false;
  bool pool = false;
  bool gym = false;
  bool spa = false;
  String? checkInTime;
  String? checkOutTime;
  String? cancellationPolicy;
  String? idRequirements;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Map<String, dynamic> hotelData = {
        'hotelName': hotelName!,
        'address': address!,
        'phoneNumber': phoneNumber!,
        'email': email!,
        'roomType': roomType!,
        'roomCapacity': roomCapacity!,
        'pricePerNight': pricePerNight!,
        'wifi': wifi,
        'parking': parking,
        'restaurant': restaurant,
        'pool': pool,
        'gym': gym,
        'spa': spa,
        'checkInTime': checkInTime!,
        'checkOutTime': checkOutTime!,
        'cancellationPolicy': cancellationPolicy!,
        'idRequirements': idRequirements!,
      };

      _firestore.collection('hotels').add(hotelData).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hotel registrado exitosamente')),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al registrar hotel: $error')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Nuevo Hotel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('Información básica del hotel',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre del hotel'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el nombre del hotel';
                  }
                  return null;
                },
                onSaved: (value) => hotelName = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Dirección'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la dirección';
                  }
                  return null;
                },
                onSaved: (value) => address = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Número de teléfono'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el número de teléfono';
                  }
                  return null;
                },
                onSaved: (value) => phoneNumber = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Correo electrónico'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el correo electrónico';
                  }
                  return null;
                },
                onSaved: (value) => email = value,
              ),
              SizedBox(height: 20),
              Text('Detalles de la habitación',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tipo de habitación'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el tipo de habitación';
                  }
                  return null;
                },
                onSaved: (value) => roomType = value,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Capacidad de la habitación'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la capacidad de la habitación';
                  }
                  return null;
                },
                onSaved: (value) => roomCapacity = int.parse(value!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Precio por noche'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el precio por noche';
                  }
                  return null;
                },
                onSaved: (value) => pricePerNight = double.parse(value!),
              ),
              SizedBox(height: 20),
              Text('Servicios y comodidades',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              CheckboxListTile(
                title: Text('Wi-Fi'),
                value: wifi,
                onChanged: (value) {
                  setState(() {
                    wifi = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Estacionamiento'),
                value: parking,
                onChanged: (value) {
                  setState(() {
                    parking = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Restaurante o servicio de comidas'),
                value: restaurant,
                onChanged: (value) {
                  setState(() {
                    restaurant = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Piscina'),
                value: pool,
                onChanged: (value) {
                  setState(() {
                    pool = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Gimnasio'),
                value: gym,
                onChanged: (value) {
                  setState(() {
                    gym = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Spa'),
                value: spa,
                onChanged: (value) {
                  setState(() {
                    spa = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              Text('Políticas y reglas',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(labelText: 'Hora de check-in'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la hora de check-in';
                  }
                  return null;
                },
                onSaved: (value) => checkInTime = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Hora de check-out'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la hora de check-out';
                  }
                  return null;
                },
                onSaved: (value) => checkOutTime = value,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Política de cancelación'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la política de cancelación';
                  }
                  return null;
                },
                onSaved: (value) => cancellationPolicy = value,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Requisitos de identificación'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese los requisitos de identificación';
                  }
                  return null;
                },
                onSaved: (value) => idRequirements = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Registrar Hotel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
