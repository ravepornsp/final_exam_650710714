import 'package:flutter/material.dart';
import './component/navbar.dart';


class CalculatorForm extends StatefulWidget {
  @override
  _CalculatorFormState createState() => _CalculatorFormState();
}

class _CalculatorFormState extends State<CalculatorForm> {
  final _formKey = GlobalKey<FormState>();
  String? _weight;
  String? _selectedItem;
  bool _isPackingChecked = false;
  bool _isInsuranceChecked = false;
  String? _status = 'ปกติ';
  double _totalCost = 0.0;

  void _calculateCost() {
    if (_formKey.currentState!.validate()) {
      double weight = double.tryParse(_weight ?? '0') ?? 0;
      double baseRate = 0;

      if (_selectedItem == 'ในเมือง') {
        baseRate = 10;
      } else if (_selectedItem == 'ต่างจังหวัด') {
        baseRate = 15;
      } else if (_selectedItem == 'ต่างประเทศ') {
        baseRate = 50;
      }

      double baseCost = weight * baseRate;
      double extraCost = 0;
      if (_isPackingChecked) extraCost += 20;
      if (_isInsuranceChecked) extraCost += 50;

      double urgencyCost = 0;
      if (_status == 'ด่วน') urgencyCost = 30;
      if (_status == 'ด่วนพิเศษ') urgencyCost = 50;

      setState(() {
        _totalCost = baseCost + extraCost + urgencyCost;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('คำนวณค่าจัดส่ง'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'น้ำหนักสินค้า (กก.):'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกน้ำหนัก';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _weight = value;
                  });
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'เลือกระยะทาง'),
                value: _selectedItem,
                items: ['ในเมือง', 'ต่างจังหวัด', 'ต่างประเทศ']
                    .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value;
                  });
                },
                validator: (value) => value == null ? 'กรุณาเลือกระยะทาง' : null,
              ),
              SizedBox(height: 16),
              CheckboxListTile(
                title: Text('แพ็คกิ้งพิเศษ (+20 บาท)'),
                value: _isPackingChecked,
                onChanged: (value) {
                  setState(() {
                    _isPackingChecked = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('ประกันพัสดุ (+50 บาท)'),
                value: _isInsuranceChecked,
                onChanged: (value) {
                  setState(() {
                    _isInsuranceChecked = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              Text("เลือกความเร่งด่วน"),
              RadioListTile(
                title: Text('ปกติ'),
                value: 'ปกติ',
                groupValue: _status,
                onChanged: (value) {
                  setState(() {
                    _status = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text('ด่วน'),
                value: 'ด่วน',
                groupValue: _status,
                onChanged: (value) {
                  setState(() {
                    _status = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text('ด่วนพิเศษ'),
                value: 'ด่วนพิเศษ',
                groupValue: _status,
                onChanged: (value) {
                  setState(() {
                    _status = value.toString();
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _calculateCost,
                child: Text('คำนวณราคา'),
              ),
              SizedBox(height: 16),
              Text(
                "ค่าจัดส่งทั้งหมด: ${_totalCost.toStringAsFixed(1)} บาท",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,backgroundColor: Colors.blue,height: 3),
                
              ),
            ],
          ),
        ),
      ),
            bottomNavigationBar: const BottomNavbar(currentIndex: 2),
    );
  }
}
