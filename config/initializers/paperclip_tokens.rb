Paperclip::Attachment.interpolations[:product_id] = proc do |attachment, style|
	attachment.instance.product_id
end