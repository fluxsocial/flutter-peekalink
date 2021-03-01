class PeekalinkImage {
  final String url;
  final int width;
  final int height;

  PeekalinkImage({
    this.url,
    this.width,
    this.height,
  });

  factory PeekalinkImage.fromMap(Map<String, dynamic> map) {
    return PeekalinkImage(
      url: map['url'],
      width: int.tryParse(map['width'], radix: 10),
      height: int.tryParse(map['height'], radix: 10),
    );
  }
}

class PeekalinkDetails {
  final String type;
  final String videoId;
  final String duration;
  final int viewCount;
  final int likeCount;
  final int dislikeCount;
  final int commentCount;
  final DateTime publishedAt;

  PeekalinkDetails({
    this.type,
    this.videoId,
    this.duration,
    this.viewCount,
    this.likeCount,
    this.dislikeCount,
    this.commentCount,
    this.publishedAt,
  });

  factory PeekalinkDetails.fromMap(Map<String, dynamic> map) {
    return PeekalinkDetails(
      type: map['type'],
      videoId: map['videoId'],
      duration: map['duration'],
      viewCount: int.tryParse(map['viewCount'], radix: 10),
      likeCount: int.tryParse(map['likeCount'], radix: 10),
      dislikeCount: int.tryParse(map['dislikeCount'], radix: 10),
      commentCount: int.tryParse(map['commentCount'], radix: 10),
      publishedAt: DateTime.tryParse(map['publishedAt']),
    );
  }
}

/// Parses the response sent back from the Embedly API.
/// The fields `type` and `version` must be supplied.
class PeekalinkResponse {
  PeekalinkResponse({
    this.url,
    this.domain,
    this.lastUpdated,
    this.nextUpdate,
    this.contentType,
    this.mimeType,
    this.redirected,
    this.redirectionUrl,
    this.redirectionCount,
    this.redirectionTrail,
    this.name,
    this.trackerDetected,
    this.icon,
    this.image,
    this.title,
    this.description,
    this.details,
  });

  factory PeekalinkResponse.fromMap(Map<String, dynamic> map) {
    return PeekalinkResponse(
      title: map['title'],
      description: map['description'],
      url: map['url'],
      domain: map['domain'],
      lastUpdated: DateTime.tryParse(map['lastUpdated']),
      nextUpdate: DateTime.tryParse(map['nextUpdate']),
      contentType: map['contentType'],
      mimeType: map['mimeType'],
      redirected: map['redirected'],
      redirectionUrl: map['redirectionUrl'],
      redirectionCount: int.parse(map['redirectionCount'], radix: 10),
      redirectionTrail: map['redirectionTrail'],
      name: map['name'],
      trackerDetected: map['trackerDetected'],
      icon: PeekalinkImage.fromMap(map['icon']),
      image: PeekalinkImage.fromMap(map['image']),
      details: PeekalinkDetails.fromMap(map['details']),
    );
  }

  final String url;
  final String domain;
  final DateTime lastUpdated;
  final DateTime nextUpdate;
  final String contentType;
  final String mimeType;
  final bool redirected;
  final String redirectionUrl;
  final int redirectionCount;
  final List<String> redirectionTrail;
  final String title;
  final String description;
  final String name;
  final bool trackerDetected;
  final PeekalinkImage icon;
  final PeekalinkImage image;
  final PeekalinkDetails details;
}
