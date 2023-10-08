class User {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String avatarUrl;
  final String bio;

  User(this.id, this.username, this.firstName, this.lastName, this.avatarUrl,
      this.bio);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        avatarUrl = json['avatar_url'],
        bio = json['bio'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'avatar_url': avatarUrl,
        'bio': bio
      };
}

class ProfileModule {
  final int id;
  final String username;
  final String section;
  final String title;
  final String body;
  final imageUrl;
  final destinationUrl;
  final int priority;

  ProfileModule(this.id, this.username, this.section, this.title, this.body,
      this.imageUrl, this.destinationUrl, this.priority);

  ProfileModule.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        section = json['section'],
        title = json['title'],
        body = json['body'],
        imageUrl = json['image_url'],
        destinationUrl = json['destination_url'],
        priority = json['priority'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'section': section,
        'title': title,
        'body': body,
        'image_url': imageUrl,
        'destination_url': destinationUrl,
        'priority': priority
      };
}

class App {
  final int id;
  final String title;
  final String body;
  final imageUrl;
  final destinationUrl;
  final availability;
  final availabilityReason;

  App(this.id, this.title, this.body, this.imageUrl, this.destinationUrl,
      this.availability, this.availabilityReason);

  App.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'],
        imageUrl = json['image_url'],
        destinationUrl = json['destination_url'],
        availability = json['availability'],
        availabilityReason = json['availability_reason'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'image_url': imageUrl,
        'destination_url': destinationUrl,
        'availability': availability,
        'availability_reason': availabilityReason
      };
}

class Setting {
  final int id;
  final String title;
  final String status;
  final String func;
  final String username;

  Setting(this.id, this.title, this.status, this.func, this.username);

  Setting.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        status = json['status'],
        func = json['function'],
        username = json['username'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'status': status,
        'function': func,
        'username': username
      };
}
