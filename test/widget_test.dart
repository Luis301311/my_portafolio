import 'package:flutter_test/flutter_test.dart';
import 'package:my_portafolio/data/portfolio_data.dart';

void main() {
  test('El portafolio tiene contenido', () {
    expect(projects, isNotEmpty);
    expect(projects.where((p) => p.featured).length, 1);
    expect(skillGroups, isNotEmpty);
    expect(experience, isNotEmpty);
    expect(education, isNotEmpty);
  });
}
