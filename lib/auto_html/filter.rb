module AutoHtml
  class Filter
    def initialize(block)
      @block   = block
      @options = {}
    end

    def with(options, &block)
      @options = options
      @block   = block
    end

    def apply(text, options = {})
      full_options = @options && @options.merge(options)
      @block.call(text.to_s.dup, full_options)
    end
  end
end
