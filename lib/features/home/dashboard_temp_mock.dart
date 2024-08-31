
class DashboardProduct {
  final String imageUrl;
  final String title;
  final String description;
  final String category;

  DashboardProduct({required this.imageUrl, required this.title, required this.description, required this.category, });
}

List<DashboardProduct> getDashboardProductMock() {

  return [
    DashboardProduct(
      imageUrl: 'https://images.unsplash.com/photo-1515586000433-45406d8e6662?q=80&w=2718&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      title: 'Rosemary',
      description: '25 CZK / 1 plant',
      category: 'Herb'
    ),
    DashboardProduct(
      imageUrl: 'https://images.unsplash.com/photo-1621014882299-9ec639c125f1?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTJ8fGhlcmJzJTIwaW4lMjBwb3RzfGVufDB8fDB8fHww',
      title: 'Thyme',
      description: '35 CZK / 1 plant',
      category: 'Herb'
    ),
    DashboardProduct(
      imageUrl: 'https://images.unsplash.com/photo-1607950519166-0abbd2ac81dc?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTB8fGJhc2lsfGVufDB8fDB8fHww',
      title: 'Basil',
      description: '20 CZK / 1 plant',
      category: 'Herb'
    ),
  ];
}
