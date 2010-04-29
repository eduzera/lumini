Paperclip::Attachment.interpolations[:imageable_type] = proc do |attachment, style|
	attachment.instance.imageable_type.downcase
end

Paperclip::Attachment.interpolations[:imageable_id] = proc do |attachment, style|
	attachment.instance.imageable_id
end