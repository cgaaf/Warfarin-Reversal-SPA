import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

String table = """
# Recommendations
- Vitamin K 10mg IV x1 dose, may repeat Q24hrs as needed
- 4-Factor PCC (Kcentra) - Dosing based on INR (see chart below) ***DO NOT REPEAT***
- Repeat INR 1 hour after end of PCC infusion, then Q6hrs x 24hrs
- If repeat INR > 1.4, give FFP 15 mL/kg STAT

| **INR**   | **4 Factor PCC (KCentra) Dosing** |
| --------- | --------------------------------- |
| 1.4 - 3.9 | 25 units/kg, max 2500 units       |
| 4 - 5.9   | 35 units/kg, max 3500 units       |
| ≥ 6       | 50 units/kg, max 5000 units       |
| Unknown   | 50 units/kg, max 5000 units       |
""";

MarkdownStyleSheet style = MarkdownStyleSheet(h1Align: WrapAlignment.center);
