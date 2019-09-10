/// 头条消息
class MessageEntity {
	List<MessageData> data;
	String dataType;
	bool hasNext;
	String appCode;
	int page;
	String version;
	String retcode;

	MessageEntity({this.data, this.dataType, this.hasNext, this.appCode, this.page, this.version, this.retcode});

	MessageEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<MessageData>();(json['data'] as List).forEach((v) { data.add(new MessageData.fromJson(v)); });
		}
		dataType = json['dataType'];
		hasNext = json['hasNext'];
		appCode = json['appCode'];
		page = json['page'];
		version = json['version'];
		retcode = json['retcode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		data['dataType'] = this.dataType;
		data['hasNext'] = this.hasNext;
		data['appCode'] = this.appCode;
		data['page'] = this.page;
		data['version'] = this.version;
		data['retcode'] = this.retcode;
		return data;
	}
}

class MessageData {
	String source;
	String title;
	int behotTime;
	String mediaUrl;
	String sourceUrl;
	bool hasVideo;
	bool isFeedAd;
	bool isStick;
	int videoPlayCount;
	bool middleMode;
	String tag;
	bool moreMode;
	String chineseTag;
	String videoDurationStr;
	String itemId;
	String imageUrl;
	int groupSource;
	String xAbstract;
	String groupId;
	int commentsCount;
	String middleImage;
	String tagUrl;
	bool hasGallery;
	String mediaAvatarUrl;
	bool singleMode;
	String articleGenre;
	String videoId;
	List<MessageDataImageList> imageList;

	MessageData({this.source, this.title, this.behotTime, this.mediaUrl, this.sourceUrl, this.hasVideo, this.isFeedAd, this.isStick, this.videoPlayCount, this.middleMode, this.tag, this.moreMode, this.chineseTag, this.videoDurationStr, this.itemId, this.imageUrl, this.groupSource, this.xAbstract, this.groupId, this.commentsCount, this.middleImage, this.tagUrl, this.hasGallery, this.mediaAvatarUrl, this.singleMode, this.articleGenre, this.videoId, this.imageList});

	MessageData.fromJson(Map<String, dynamic> json) {
		source = json['source'];
		title = json['title'];
		behotTime = json['behot_time'];
		mediaUrl = json['media_url'];
		sourceUrl = json['source_url'];
		hasVideo = json['has_video'];
		isFeedAd = json['is_feed_ad'];
		isStick = json['is_stick'];
		videoPlayCount = json['video_play_count'];
		middleMode = json['middle_mode'];
		tag = json['tag'];
		moreMode = json['more_mode'];
		chineseTag = json['chinese_tag'];
		videoDurationStr = json['video_duration_str'];
		itemId = json['item_id'];
		imageUrl = json['image_url'];
		groupSource = json['group_source'];
		xAbstract = json['abstract'];
		groupId = json['group_id'];
		commentsCount = json['comments_count'];
		middleImage = json['middle_image'];
		tagUrl = json['tag_url'];
		hasGallery = json['has_gallery'];
		mediaAvatarUrl = json['media_avatar_url'];
		singleMode = json['single_mode'];
		articleGenre = json['article_genre'];
		videoId = json['video_id'];
		if (json['image_list'] != null) {
			imageList = new List<MessageDataImageList>();(json['image_list'] as List).forEach((v) { imageList.add(new MessageDataImageList.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['source'] = this.source;
		data['title'] = this.title;
		data['behot_time'] = this.behotTime;
		data['media_url'] = this.mediaUrl;
		data['source_url'] = this.sourceUrl;
		data['has_video'] = this.hasVideo;
		data['is_feed_ad'] = this.isFeedAd;
		data['is_stick'] = this.isStick;
		data['video_play_count'] = this.videoPlayCount;
		data['middle_mode'] = this.middleMode;
		data['tag'] = this.tag;
		data['more_mode'] = this.moreMode;
		data['chinese_tag'] = this.chineseTag;
		data['video_duration_str'] = this.videoDurationStr;
		data['item_id'] = this.itemId;
		data['image_url'] = this.imageUrl;
		data['group_source'] = this.groupSource;
		data['abstract'] = this.xAbstract;
		data['group_id'] = this.groupId;
		data['comments_count'] = this.commentsCount;
		data['middle_image'] = this.middleImage;
		data['tag_url'] = this.tagUrl;
		data['has_gallery'] = this.hasGallery;
		data['media_avatar_url'] = this.mediaAvatarUrl;
		data['single_mode'] = this.singleMode;
		data['article_genre'] = this.articleGenre;
		data['video_id'] = this.videoId;
		if (this.imageList != null) {
      data['image_list'] =  this.imageList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class MessageDataImageList {
	String url;

	MessageDataImageList({this.url});

	MessageDataImageList.fromJson(Map<String, dynamic> json) {
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['url'] = this.url;
		return data;
	}
}
