module AutoHtml
  extend self

  def self.add_filter(name, &block)
    Builder.add_filter(name, &block)
  end

  def auto_html(raw, &proc)
    return "" if raw.blank?
    builder = Builder.new(raw)
    result = builder.instance_eval(&proc)
    return raw unless result
    result.respond_to?(:html_safe) ?
      result.html_safe : result
  end

end
