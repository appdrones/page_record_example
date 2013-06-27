module TeamsHelper

	def form_record_for(type, var=nil)
		if var
			id = var.id
		else
			id = instance_eval("@#{type}.id")
		end
		@type = type
		Hash["data-#{type}-id",id]
	end

	def attribute_for(name)
		Hash["data-attribute-for",name]
	end

	def action_for(name)
		Hash["data-action-for",name]
	end

	def attribute_tag_for(name, attribute, content_or_options_with_block = nil, options = nil, escape = true, &block)
		options||= options ? options << {'data-attribute-for' => attribute} :{'data-attribute-for' => attribute}
	  if block_given?
	    options = content_or_options_with_block if content_or_options_with_block.is_a?(Hash)
	    content_tag_string(name, capture(&block), options, escape)
	  else
	    content_tag_string(name, content_or_options_with_block, options, escape)
	  end
	end


end
