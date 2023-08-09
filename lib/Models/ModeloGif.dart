import 'dart:convert';

ModeloGif modeloGifFromJson(String str) => ModeloGif.fromJson(json.decode(str));

String modeloGifToJson(ModeloGif data) => json.encode(data.toJson());

class Gifs {
  List<ModeloGif> items = [];
  Gifs();
  Gifs.fromJsonList(jsonList) {
    if (jsonList == null) return;
    for (var elemento in jsonList['data']) {
      final gif = ModeloGif.fromJson(elemento);
      items.add(gif);
    }
  }
}

class ModeloGif {
  final String? type;
  final String? id;
  final String? url;
  final String? slug;
  final String? bitlyGifUrl;
  final String? bitlyUrl;
  final String? embedUrl;
  final String? username;
  final String? source;
  final String? title;
  final String? rating;
  final String? contentUrl;
  final String? sourceTld;
  final String? sourcePostUrl;
  final int? isSticker;
  final DateTime? importDatetime;
  final DateTime? trendingDatetime;
  final Images? images;
  final User? user;
  final String? analyticsResponsePayload;
  final Analytics? analytics;

  ModeloGif({
    this.type,
    this.id,
    this.url,
    this.slug,
    this.bitlyGifUrl,
    this.bitlyUrl,
    this.embedUrl,
    this.username,
    this.source,
    this.title,
    this.rating,
    this.contentUrl,
    this.sourceTld,
    this.sourcePostUrl,
    this.isSticker,
    this.importDatetime,
    this.trendingDatetime,
    this.images,
    this.user,
    this.analyticsResponsePayload,
    this.analytics,
  });

  factory ModeloGif.fromJson(Map<String, dynamic> json) => ModeloGif(
        type: json["type"],
        id: json["id"],
        url: json["url"],
        slug: json["slug"],
        bitlyGifUrl: json["bitly_gif_url"],
        bitlyUrl: json["bitly_url"],
        embedUrl: json["embed_url"],
        username: json["username"],
        source: json["source"],
        title: json["title"],
        rating: json["rating"],
        contentUrl: json["content_url"],
        sourceTld: json["source_tld"],
        sourcePostUrl: json["source_post_url"],
        isSticker: json["is_sticker"],
        importDatetime: json["import_datetime"] == null
            ? null
            : DateTime.parse(json["import_datetime"]),
        trendingDatetime: json["trending_datetime"] == null
            ? null
            : DateTime.parse(json["trending_datetime"]),
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        analyticsResponsePayload: json["analytics_response_payload"],
        analytics: json["analytics"] == null
            ? null
            : Analytics.fromJson(json["analytics"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "url": url,
        "slug": slug,
        "bitly_gif_url": bitlyGifUrl,
        "bitly_url": bitlyUrl,
        "embed_url": embedUrl,
        "username": username,
        "source": source,
        "title": title,
        "rating": rating,
        "content_url": contentUrl,
        "source_tld": sourceTld,
        "source_post_url": sourcePostUrl,
        "is_sticker": isSticker,
        "import_datetime": importDatetime?.toIso8601String(),
        "trending_datetime": trendingDatetime?.toIso8601String(),
        "images": images?.toJson(),
        "user": user?.toJson(),
        "analytics_response_payload": analyticsResponsePayload,
        "analytics": analytics?.toJson(),
      };
}

class Analytics {
  final Onclick? onload;
  final Onclick? onclick;
  final Onclick? onsent;

  Analytics({
    this.onload,
    this.onclick,
    this.onsent,
  });

  factory Analytics.fromJson(Map<String, dynamic> json) => Analytics(
        onload:
            json["onload"] == null ? null : Onclick.fromJson(json["onload"]),
        onclick:
            json["onclick"] == null ? null : Onclick.fromJson(json["onclick"]),
        onsent:
            json["onsent"] == null ? null : Onclick.fromJson(json["onsent"]),
      );

  Map<String, dynamic> toJson() => {
        "onload": onload?.toJson(),
        "onclick": onclick?.toJson(),
        "onsent": onsent?.toJson(),
      };
}

class Onclick {
  final String? url;

  Onclick({
    this.url,
  });

  factory Onclick.fromJson(Map<String, dynamic> json) => Onclick(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Images {
  final FixedHeight? original;
  final The480WStill? downsized;
  final The480WStill? downsizedLarge;
  final The480WStill? downsizedMedium;
  final DownsizedSmall? downsizedSmall;
  final The480WStill? downsizedStill;
  final FixedHeight? fixedHeight;
  final FixedHeight? fixedHeightDownsampled;
  final FixedHeight? fixedHeightSmall;
  final The480WStill? fixedHeightSmallStill;
  final The480WStill? fixedHeightStill;
  final FixedHeight? fixedWidth;
  final FixedHeight? fixedWidthDownsampled;
  final FixedHeight? fixedWidthSmall;
  final The480WStill? fixedWidthSmallStill;
  final The480WStill? fixedWidthStill;
  final Looping? looping;
  final The480WStill? originalStill;
  final DownsizedSmall? originalMp4;
  final DownsizedSmall? preview;
  final The480WStill? previewGif;
  final The480WStill? previewWebp;
  final DownsizedSmall? hd;
  final The480WStill? the480WStill;

  Images({
    this.original,
    this.downsized,
    this.downsizedLarge,
    this.downsizedMedium,
    this.downsizedSmall,
    this.downsizedStill,
    this.fixedHeight,
    this.fixedHeightDownsampled,
    this.fixedHeightSmall,
    this.fixedHeightSmallStill,
    this.fixedHeightStill,
    this.fixedWidth,
    this.fixedWidthDownsampled,
    this.fixedWidthSmall,
    this.fixedWidthSmallStill,
    this.fixedWidthStill,
    this.looping,
    this.originalStill,
    this.originalMp4,
    this.preview,
    this.previewGif,
    this.previewWebp,
    this.hd,
    this.the480WStill,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        original: json["original"] == null
            ? null
            : FixedHeight.fromJson(json["original"]),
        downsized: json["downsized"] == null
            ? null
            : The480WStill.fromJson(json["downsized"]),
        downsizedLarge: json["downsized_large"] == null
            ? null
            : The480WStill.fromJson(json["downsized_large"]),
        downsizedMedium: json["downsized_medium"] == null
            ? null
            : The480WStill.fromJson(json["downsized_medium"]),
        downsizedSmall: json["downsized_small"] == null
            ? null
            : DownsizedSmall.fromJson(json["downsized_small"]),
        downsizedStill: json["downsized_still"] == null
            ? null
            : The480WStill.fromJson(json["downsized_still"]),
        fixedHeight: json["fixed_height"] == null
            ? null
            : FixedHeight.fromJson(json["fixed_height"]),
        fixedHeightDownsampled: json["fixed_height_downsampled"] == null
            ? null
            : FixedHeight.fromJson(json["fixed_height_downsampled"]),
        fixedHeightSmall: json["fixed_height_small"] == null
            ? null
            : FixedHeight.fromJson(json["fixed_height_small"]),
        fixedHeightSmallStill: json["fixed_height_small_still"] == null
            ? null
            : The480WStill.fromJson(json["fixed_height_small_still"]),
        fixedHeightStill: json["fixed_height_still"] == null
            ? null
            : The480WStill.fromJson(json["fixed_height_still"]),
        fixedWidth: json["fixed_width"] == null
            ? null
            : FixedHeight.fromJson(json["fixed_width"]),
        fixedWidthDownsampled: json["fixed_width_downsampled"] == null
            ? null
            : FixedHeight.fromJson(json["fixed_width_downsampled"]),
        fixedWidthSmall: json["fixed_width_small"] == null
            ? null
            : FixedHeight.fromJson(json["fixed_width_small"]),
        fixedWidthSmallStill: json["fixed_width_small_still"] == null
            ? null
            : The480WStill.fromJson(json["fixed_width_small_still"]),
        fixedWidthStill: json["fixed_width_still"] == null
            ? null
            : The480WStill.fromJson(json["fixed_width_still"]),
        looping:
            json["looping"] == null ? null : Looping.fromJson(json["looping"]),
        originalStill: json["original_still"] == null
            ? null
            : The480WStill.fromJson(json["original_still"]),
        originalMp4: json["original_mp4"] == null
            ? null
            : DownsizedSmall.fromJson(json["original_mp4"]),
        preview: json["preview"] == null
            ? null
            : DownsizedSmall.fromJson(json["preview"]),
        previewGif: json["preview_gif"] == null
            ? null
            : The480WStill.fromJson(json["preview_gif"]),
        previewWebp: json["preview_webp"] == null
            ? null
            : The480WStill.fromJson(json["preview_webp"]),
        hd: json["hd"] == null ? null : DownsizedSmall.fromJson(json["hd"]),
        the480WStill: json["480w_still"] == null
            ? null
            : The480WStill.fromJson(json["480w_still"]),
      );

  Map<String, dynamic> toJson() => {
        "original": original?.toJson(),
        "downsized": downsized?.toJson(),
        "downsized_large": downsizedLarge?.toJson(),
        "downsized_medium": downsizedMedium?.toJson(),
        "downsized_small": downsizedSmall?.toJson(),
        "downsized_still": downsizedStill?.toJson(),
        "fixed_height": fixedHeight?.toJson(),
        "fixed_height_downsampled": fixedHeightDownsampled?.toJson(),
        "fixed_height_small": fixedHeightSmall?.toJson(),
        "fixed_height_small_still": fixedHeightSmallStill?.toJson(),
        "fixed_height_still": fixedHeightStill?.toJson(),
        "fixed_width": fixedWidth?.toJson(),
        "fixed_width_downsampled": fixedWidthDownsampled?.toJson(),
        "fixed_width_small": fixedWidthSmall?.toJson(),
        "fixed_width_small_still": fixedWidthSmallStill?.toJson(),
        "fixed_width_still": fixedWidthStill?.toJson(),
        "looping": looping?.toJson(),
        "original_still": originalStill?.toJson(),
        "original_mp4": originalMp4?.toJson(),
        "preview": preview?.toJson(),
        "preview_gif": previewGif?.toJson(),
        "preview_webp": previewWebp?.toJson(),
        "hd": hd?.toJson(),
        "480w_still": the480WStill?.toJson(),
      };
}

class The480WStill {
  final String? height;
  final String? width;
  final String? size;
  final String? url;

  The480WStill({
    this.height,
    this.width,
    this.size,
    this.url,
  });

  factory The480WStill.fromJson(Map<String, dynamic> json) => The480WStill(
        height: json["height"],
        width: json["width"],
        size: json["size"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "size": size,
        "url": url,
      };
}

class DownsizedSmall {
  final String? height;
  final String? width;
  final String? mp4Size;
  final String? mp4;

  DownsizedSmall({
    this.height,
    this.width,
    this.mp4Size,
    this.mp4,
  });

  factory DownsizedSmall.fromJson(Map<String, dynamic> json) => DownsizedSmall(
        height: json["height"],
        width: json["width"],
        mp4Size: json["mp4_size"],
        mp4: json["mp4"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "mp4_size": mp4Size,
        "mp4": mp4,
      };
}

class FixedHeight {
  final String? height;
  final String? width;
  final String? size;
  final String? url;
  final String? mp4Size;
  final String? mp4;
  final String? webpSize;
  final String? webp;
  final String? frames;
  final String? hash;

  FixedHeight({
    this.height,
    this.width,
    this.size,
    this.url,
    this.mp4Size,
    this.mp4,
    this.webpSize,
    this.webp,
    this.frames,
    this.hash,
  });

  factory FixedHeight.fromJson(Map<String, dynamic> json) => FixedHeight(
        height: json["height"],
        width: json["width"],
        size: json["size"],
        url: json["url"],
        mp4Size: json["mp4_size"],
        mp4: json["mp4"],
        webpSize: json["webp_size"],
        webp: json["webp"],
        frames: json["frames"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "size": size,
        "url": url,
        "mp4_size": mp4Size,
        "mp4": mp4,
        "webp_size": webpSize,
        "webp": webp,
        "frames": frames,
        "hash": hash,
      };
}

class Looping {
  final String? mp4Size;
  final String? mp4;

  Looping({
    this.mp4Size,
    this.mp4,
  });

  factory Looping.fromJson(Map<String, dynamic> json) => Looping(
        mp4Size: json["mp4_size"],
        mp4: json["mp4"],
      );

  Map<String, dynamic> toJson() => {
        "mp4_size": mp4Size,
        "mp4": mp4,
      };
}

class User {
  final String? avatarUrl;
  final String? bannerImage;
  final String? bannerUrl;
  final String? profileUrl;
  final String? username;
  final String? displayName;
  final String? description;
  final String? instagramUrl;
  final String? websiteUrl;
  final bool? isVerified;

  User({
    this.avatarUrl,
    this.bannerImage,
    this.bannerUrl,
    this.profileUrl,
    this.username,
    this.displayName,
    this.description,
    this.instagramUrl,
    this.websiteUrl,
    this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        avatarUrl: json["avatar_url"],
        bannerImage: json["banner_image"],
        bannerUrl: json["banner_url"],
        profileUrl: json["profile_url"],
        username: json["username"],
        displayName: json["display_name"],
        description: json["description"],
        instagramUrl: json["instagram_url"],
        websiteUrl: json["website_url"],
        isVerified: json["is_verified"],
      );

  Map<String, dynamic> toJson() => {
        "avatar_url": avatarUrl,
        "banner_image": bannerImage,
        "banner_url": bannerUrl,
        "profile_url": profileUrl,
        "username": username,
        "display_name": displayName,
        "description": description,
        "instagram_url": instagramUrl,
        "website_url": websiteUrl,
        "is_verified": isVerified,
      };
}
