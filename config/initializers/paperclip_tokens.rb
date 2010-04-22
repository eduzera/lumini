Paperclip::Attachment.interpolation[:product_id] = proc do |attachment, style|
	attachment.instance.product_id
end