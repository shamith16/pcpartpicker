class BuildGuides {
  List<Categories> categories;

  BuildGuides({this.categories});

  BuildGuides.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String title;
  List<Guides> guides;

  Categories({this.title, this.guides});

  Categories.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['guides'] != null) {
      guides = new List<Guides>();
      json['guides'].forEach((v) {
        guides.add(new Guides.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.guides != null) {
      data['guides'] = this.guides.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Guides {
  String path;
  String title;
  List<String> products;
  String price;
  int comments;
  List<String> images;

  Guides(
      {this.path,
        this.title,
        this.products,
        this.price,
        this.comments,
        this.images});

  Guides.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    title = json['title'];
    products = json['products'].cast<String>();
    price = json['price'];
    comments = json['comments'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['title'] = this.title;
    data['products'] = this.products;
    data['price'] = this.price;
    data['comments'] = this.comments;
    data['images'] = this.images;
    return data;
  }
}
