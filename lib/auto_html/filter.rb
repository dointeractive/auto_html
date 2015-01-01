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
      _options = @options && @options.merge(options)
      @block.call(text.to_s.dup, _options)
    end
  end
end
