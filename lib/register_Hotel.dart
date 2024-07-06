import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterHotel extends StatefulWidget {
  @override
  _RegisterHotelState createState() => _RegisterHotelState();
}

class _RegisterHotelState extends State<RegisterHotel> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _hotelNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _roomTypeController = TextEditingController();
  final TextEditingController _roomCapacityController = TextEditingController();
  final TextEditingController _pricePerNightController =
      TextEditingController();
  final TextEditingController _checkInTimeController = TextEditingController();
  final TextEditingController _checkOutTimeController = TextEditingController();
  final TextEditingController _cancellationPolicyController =
      TextEditingController();
  final TextEditingController _idRequirementsController =
      TextEditingController();

  bool wifi = false;
  bool parking = false;
  bool restaurant = false;
  bool pool = false;
  bool gym = false;
  bool spa = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> hotelData = {
        'hotelName': _hotelNameController.text,
        'address': _addressController.text,
        'phoneNumber': _phoneNumberController.text,
        'email': _emailController.text,
        'roomType': _roomTypeController.text,
        'roomCapacity': int.tryParse(_roomCapacityController.text) ?? 0,
        'pricePerNight': double.tryParse(_pricePerNightController.text) ?? 0.0,
        'wifi': wifi,
        'parking': parking,
        'restaurant': restaurant,
        'pool': pool,
        'gym': gym,
        'spa': spa,
        'checkInTime': _checkInTimeController.text,
        'checkOutTime': _checkOutTimeController.text,
        'cancellationPolicy': _cancellationPolicyController.text,
        'idRequirements': _idRequirementsController.text,
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
  void dispose() {
    _hotelNameController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _roomTypeController.dispose();
    _roomCapacityController.dispose();
    _pricePerNightController.dispose();
    _checkInTimeController.dispose();
    _checkOutTimeController.dispose();
    _cancellationPolicyController.dispose();
    _idRequirementsController.dispose();
    super.dispose();
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
                controller: _hotelNameController,
                decoration: InputDecoration(labelText: 'Nombre del hotel'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el nombre del hotel';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Dirección'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la dirección';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Número de teléfono'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el número de teléfono';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Correo electrónico'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el correo electrónico';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text('Detalles de la habitación',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _roomTypeController,
                decoration: InputDecoration(labelText: 'Tipo de habitación'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el tipo de habitación';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _roomCapacityController,
                decoration:
                    InputDecoration(labelText: 'Capacidad de la habitación'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la capacidad de la habitación';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pricePerNightController,
                decoration: InputDecoration(labelText: 'Precio por noche'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el precio por noche';
                  }
                  return null;
                },
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
                controller: _checkInTimeController,
                decoration: InputDecoration(labelText: 'Hora de check-in'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la hora de check-in';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _checkOutTimeController,
                decoration: InputDecoration(labelText: 'Hora de check-out'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la hora de check-out';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cancellationPolicyController,
                decoration:
                    InputDecoration(labelText: 'Política de cancelación'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la política de cancelación';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _idRequirementsController,
                decoration:
                    InputDecoration(labelText: 'Requisitos de identificación'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese los requisitos de identificación';
                  }
                  return null;
                },
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
